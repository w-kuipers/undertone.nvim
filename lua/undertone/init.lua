local M = {}

local defaults = {
  -- Use the terminal's own background instead of pure black.
  transparent = false,
  -- Per-group overrides merged on top of the theme,
  -- e.g. { Comment = { fg = '#808080', italic = true } }.
  -- Specs follow vim.api.nvim_set_hl().
  overrides = {},
}

M.options = defaults

function M.setup(opts)
  M.options = vim.tbl_deep_extend('force', {}, defaults, opts or {})
end

-- Near-monochrome on purpose: only yellow and the peach accent survive.
local function set_terminal_colors(p)
  local colors = {
    p.bg, p.peach, p.muted, p.warning, p.muted, p.peach, p.fg, p.bright,
    p.subtle, p.subtle, p.faint, p.subtle, p.peach, p.peach, p.fg, p.bright,
  }
  for i, color in ipairs(colors) do
    vim.g['terminal_color_' .. (i - 1)] = color
  end
end

function M.load()
  if vim.g.colors_name then
    vim.cmd.highlight 'clear'
  end
  vim.o.termguicolors = true
  vim.g.colors_name = 'undertone'

  local palette = require 'undertone.palette'
  local groups = require('undertone.groups').get(palette, M.options)

  for name, spec in pairs(M.options.overrides) do
    groups[name] = spec
  end
  for name, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, name, spec)
  end

  set_terminal_colors(palette)
end

return M
