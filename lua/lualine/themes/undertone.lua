-- Follows the active variant; falls back to the configured one
-- when lualine loads before the colorscheme.
local p = require('undertone').palette()

local mode = {
  a = { fg = p.bg, bg = p.bright, gui = 'bold' },
  b = { fg = p.bright, bg = p.overlay },
  c = { fg = p.muted, bg = p.none },
}

return {
  normal = mode,
  insert = mode,
  visual = mode,
  replace = mode,
  command = mode,
  terminal = mode,
  inactive = {
    a = { fg = p.faint, bg = p.bg, gui = 'bold' },
    b = { fg = p.faint, bg = p.bg },
    c = { fg = p.faint, bg = p.none },
  },
}
