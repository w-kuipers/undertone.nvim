local M = {}

local defaults = {
  -- 'default' (warm near-black), 'ink', 'smoke' or 'paper'.
  -- The undertone-ink/-smoke/-paper colorschemes ignore this and
  -- force their own variant.
  variant = 'default',
  -- Use the terminal's own background instead of the theme's.
  transparent = false,
  -- Per-group overrides merged on top of the theme,
  -- e.g. { Comment = { fg = '#808080', italic = true } }.
  -- Specs follow vim.api.nvim_set_hl().
  overrides = {},
}

M.options = defaults

-- The variant currently on screen; nil before the first load().
M.current = nil

function M.setup(opts)
  M.options = vim.tbl_deep_extend('force', {}, defaults, opts or {})
end

-- Palette of the active variant (or a specific one, if given).
function M.palette(variant)
  return require('undertone.palette')[variant or M.current or M.options.variant]
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

function M.load(variant)
  variant = variant or M.options.variant
  local palette = require('undertone.palette')[variant]
  if not palette then
    error(('undertone: unknown variant %q'):format(variant))
  end

  if vim.g.colors_name then
    vim.cmd.highlight 'clear'
  end
  -- Unset first: changing 'background' reloads the active colorscheme.
  vim.g.colors_name = nil
  vim.o.termguicolors = true
  vim.o.background = variant == 'paper' and 'light' or 'dark'
  vim.g.colors_name = variant == 'default' and 'undertone' or 'undertone-' .. variant
  M.current = variant

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
