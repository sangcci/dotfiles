import math
from functools import wraps
from pathlib import Path

from kitty.boss import get_boss
from kitty.fast_data_types import Screen, get_options
from kitty.tab_bar import (
    DrawData,
    ExtraData,
    TabBarData,
    as_rgb,
    draw_tab_with_separator,
)

opts = get_options()


def _patch_tab_bar_click_handlers():
    """Keep kitty's mouse hitboxes in sync with our manual tab shift.

    The custom drawer inserts spaces before the already-drawn tabs to center
    them between the left and right status sections. kitty's stored tab ranges
    are still based on the original position, so translate click coordinates
    back by the same amount before kitty performs its normal hit test.
    """
    global _tab_bar_click_handlers_patched

    if _tab_bar_click_handlers_patched:
        return

    try:
        from kitty.tab_bar import TabBar
    except Exception:
        return

    # If this file was reloaded after the previous attempt, remove that old
    # extents-shifting update patch first. Otherwise click coordinates and
    # extents would both be shifted and cancel the fix.
    if getattr(TabBar.update, "_custom_tab_extent_shift_patch", False):
        TabBar.update = TabBar.update.__wrapped__

    if getattr(TabBar.tab_id_at, "_custom_tab_click_shift_patch", False):
        _tab_bar_click_handlers_patched = True
        return

    original_tab_id_at = TabBar.tab_id_at

    @wraps(original_tab_id_at)
    def tab_id_at_with_shifted_click(self, x, y):
        tab_shift = getattr(TabBar, "_custom_last_tab_shift", 0)
        if tab_shift and not getattr(self, "is_vertical", False):
            x -= tab_shift * getattr(self, "cell_width", 0)
        return original_tab_id_at(self, x, y)

    tab_id_at_with_shifted_click._custom_tab_click_shift_patch = True
    TabBar.tab_id_at = tab_id_at_with_shifted_click
    _tab_bar_click_handlers_patched = True


lavender = as_rgb(int("B4BEFE", 16))
surface1 = as_rgb(int("45475A", 16))
base = as_rgb(int("1E1E2E", 16))
window_icon = ""
layout_icon = ""
active_tab_layout_name = ""
active_tab_num_windows = 1
left_status_length = 0
_last_tab_shift = 0
_tab_bar_click_handlers_patched = False

_patch_tab_bar_click_handlers()


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    global active_tab_layout_name
    global active_tab_num_windows

    if tab.is_active:
        active_tab_layout_name = tab.layout_name
        active_tab_num_windows = tab.num_windows

    if index == 1:
        _draw_left_status(screen)

    draw_tab_with_separator(
        draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
    )

    # calculate and insert leading spaces to separate tabs from left status
    if is_last:
        screen_cursor_x = screen.cursor.x
        center_status_length = screen_cursor_x - left_status_length
        leading_spaces = math.ceil(
            (screen.columns - left_status_length * 2 - center_status_length) / 2
        )
        screen.cursor.x = left_status_length
        screen.insert_characters(leading_spaces)
        try:
            from kitty.tab_bar import TabBar
            TabBar._custom_last_tab_shift = leading_spaces
        except Exception:
            pass
        screen.cursor.x = screen_cursor_x + leading_spaces

    if is_last:
        _draw_right_status(screen, is_last)

    return screen.cursor.x


def _draw_left_status(screen: Screen):
    global left_status_length

    cwd = get_cwd()
    cells = [
        (surface1, base, cwd),
    ]

    left_status_length = 0
    for _, _, cell in cells:
        left_status_length += len(cell)
    try:
        from kitty.tab_bar import TabBar
        TabBar._custom_left_status_length = left_status_length
    except Exception:
        pass

    # draw right status
    for fg, bg, cell in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    # update cursor position
    screen.cursor.x = left_status_length
    return screen.cursor.x


def _draw_right_status(screen: Screen, is_last: bool) -> int:
    layout_fg = surface1 if active_tab_layout_name == "fat" else lavender
    cells = [
        # layout name
        (layout_fg, base, " " + layout_icon + " "),
        (layout_fg, base, active_tab_layout_name + " "),
        # num windows
        (surface1, base, " " + window_icon + " "),
        (surface1, base, str(active_tab_num_windows)),
    ]

    # calculate leading spaces to separate tabs from right status
    right_status_length = 0
    for _, _, cell in cells:
        right_status_length += len(cell)
    leading_spaces = 0
    if opts.tab_bar_align == "center":
        leading_spaces = (
            math.ceil((screen.columns - screen.cursor.x) / 2) - right_status_length
        )
    elif opts.tab_bar_align == "left":
        leading_spaces = screen.columns - screen.cursor.x - right_status_length

    # draw leading spaces
    if leading_spaces > 0:
        screen.draw(" " * leading_spaces)

    # draw right status
    for fg, bg, cell in cells:
        screen.cursor.fg = fg
        screen.cursor.bg = bg
        screen.draw(cell)
    screen.cursor.fg = 0
    screen.cursor.bg = 0

    # update cursor position
    screen.cursor.x = max(screen.cursor.x, screen.columns - right_status_length)
    return screen.cursor.x


def truncate_str(input_str, max_length):
    if len(input_str) > max_length:
        half = max_length // 2
        return input_str[:half] + "…" + input_str[-half:]
    else:
        return input_str


def get_cwd():
    cwd = ""
    tab_manager = get_boss().active_tab_manager
    if tab_manager is not None:
        window = tab_manager.active_window
        if window is not None:
            cwd = window.cwd_of_child

    cwd_parts = list(Path(cwd).parts)
    if len(cwd_parts) > 1:
        if cwd_parts[1] == "home":
            # replace /home/{{username}}
            cwd_parts = ["~"] + cwd_parts[3:]
            if len(cwd_parts) > 1:
                cwd_parts[0] = "~/"
        else:
            cwd_parts[0] = "/"
    else:
        cwd_parts[0] = "/"

    max_length = 10
    if len(cwd_parts) < 3:
        cwd = cwd_parts[0] + "/".join(
            [
                s if len(s) <= max_length else truncate_str(s, max_length)
                for s in cwd_parts[1:]
            ]
        )
    else:
        cwd = "…/" + "/".join(
            [
                s if len(s) <= max_length else truncate_str(s, max_length)
                for s in cwd_parts[-2:]
            ]
        )

    return cwd
