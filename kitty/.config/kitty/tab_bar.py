# pyright: reportMissingImports=false
# flake8: noqa

from __future__ import annotations

import os

from kitty.fast_data_types import Screen, wcswidth
from kitty.rgb import to_color
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb
from kitty.utils import color_as_int

# Image-like custom tab bar:
# center: active tab + inactive tabs

BAR_BG = "#1c1c1c"
ACTIVE_FG = "#ffffff"
INACTIVE_FG = "#7f7f7f"

# Keep active/inactive tab padding identical so text position stays stable.
TAB_PAD = 3
MAX_TITLE_CELLS = 20
SHELL_TITLES = {"sh", "bash", "zsh", "fish", "dash", "ksh", "tcsh", "csh"}

ACTIVE_TAB_INDEX = 1
LAYOUT_TABS: list[tuple[str, bool]] = []


def rgb(color: str | int) -> int:
    if isinstance(color, str):
        return as_rgb(color_as_int(to_color(color)))
    return as_rgb(color_as_int(color))


def width(text: str) -> int:
    return max(0, wcswidth(text))


def title_for(tab: TabBarData) -> str:
    title = (tab.title or "shell").strip() or "shell"
    shell_name = os.path.basename(title).lstrip("-").lower()
    if shell_name in SHELL_TITLES:
        return "kitty"
    return title


def truncate(text: str, max_cells: int) -> str:
    if max_cells <= 0:
        return ""
    if width(text) <= max_cells:
        return text

    out = ""
    used = 0
    for ch in text:
        ch_width = width(ch)
        if used + ch_width > max_cells - 1:
            break
        out += ch
        used += ch_width
    return out + "…"


def tab_width(title: str, is_active: bool) -> int:
    return width(title) + TAB_PAD * 2


def total_tabs_width() -> int:
    return sum(tab_width(title, active) for title, active in LAYOUT_TABS)


def set_colors(screen: Screen, fg: str | int, bg: str | int = BAR_BG) -> None:
    screen.cursor.fg = rgb(fg)
    screen.cursor.bg = rgb(bg)


def draw_text(screen: Screen, text: str, fg: str | int, bg: str | int = BAR_BG) -> None:
    set_colors(screen, fg, bg)
    screen.draw(text)


def center_start(screen: Screen) -> int:
    total = total_tabs_width()
    return max(0, (screen.columns - total) // 2)


def draw_single_tab(screen: Screen, tab: TabBarData, max_title_length: int) -> None:
    title = truncate(title_for(tab), min(max_title_length, MAX_TITLE_CELLS))
    if tab.is_active:
        set_colors(screen, ACTIVE_FG)
        screen.draw(" " * TAB_PAD)
        screen.draw(title)
        screen.draw(" " * TAB_PAD)
        return

    set_colors(screen, INACTIVE_FG)
    screen.draw(" " * TAB_PAD)
    screen.draw(title)
    screen.draw(" " * TAB_PAD)


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
    global ACTIVE_TAB_INDEX, LAYOUT_TABS

    title = truncate(title_for(tab), min(max_title_length, MAX_TITLE_CELLS))

    # kitty calls this once for layout measurement before drawing. Use that pass
    # to remember all tab titles, then do the actual center positioning in the
    # real draw pass below. This keeps all layout decisions inside this script.
    if extra_data.for_layout:
        if index == 1:
            LAYOUT_TABS = []
        LAYOUT_TABS.append((title, tab.is_active))
        screen.cursor.x += tab_width(title, tab.is_active)
        return screen.cursor.x

    if tab.is_active:
        ACTIVE_TAB_INDEX = index

    set_colors(screen, INACTIVE_FG)

    if index == 1:
        screen.cursor.x = center_start(screen)

    draw_single_tab(screen, tab, max_title_length)

    if is_last:
        return screen.columns

    return screen.cursor.x
