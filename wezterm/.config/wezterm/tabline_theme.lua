local M = {}

M = {
  normal_mode = {
    a = { fg = "#16161D", bg = "#C8C093" },
    b = { fg = "#C8C093", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  copy_mode = {
    a = { fg = "#16161D", bg = "#FF5D62" },
    b = { fg = "#FF5D62", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  search_mode = {
    a = { fg = "#16161D", bg = "#938AA9" },
    b = { fg = "#938AA9", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  window_mode = {
    a = { fg = "#16161D", bg = "#7E9CD8" },
    b = { fg = "#7E9CD8", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  resize_mode = {
    a = { fg = "#16161D", bg = "#FFA066" },
    b = { fg = "#FFA066", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  tab_mode = {
    a = { fg = "#16161D", bg = "#6A9589" },
    b = { fg = "#6A9589", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  default_mode = {
    a = { fg = "#16161D", bg = "#C34043" },
    b = { fg = "#C34043", bg = "#2D4F67" },
    c = { fg = "#DCD7BA", bg = "#16161D" },
  },
  tab = {
    active = { fg = '#C8C093', bg = '#16161D', bold = true },
    inactive = { fg = '#727169', bg = '#1F1F28' },
    inactive_hover = { fg = '#DCD7BA', bg = '#16161D' },
  },
  ansi = {
    "#090618",
    "#C34043",
    "#76946A",
    "#C0A36E",
    "#7E9CD8",
    "#957FB8",
    "#6A9589",
    "#DCD7BA",
  },
  brights = {
    "#727169",
    "#E82424",
    "#98BB6C",
    "#E6C384",
    "#7FB4CA",
    "#938AA9",
    "#7AA89F",
    "#DCD7BA",
  },
}

return M