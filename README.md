# Undertone

A near-monochrome theme for Neovim. The base is a warm gray ramp; strings,
keywords, types, constants and functions get muted pastels, and everything
else stays gray.

## Variants

| Colorscheme       | Background        |
| ----------------- | ----------------- |
| `undertone`       | warm near-black   |
| `undertone-ink`   | pure black        |
| `undertone-smoke` | slightly lighter  |
| `undertone-paper` | light, warm paper |

The three dark variants share the same accents; paper uses darker versions
of the same hues.

## Installation

### vim.pack (Neovim 0.12+)

```lua
vim.pack.add({ 'https://github.com/w-kuipers/undertone.nvim' })
vim.cmd.colorscheme('undertone')
```

### lazy.nvim

```lua
{
  'w-kuipers/undertone.nvim',
  config = function()
    vim.cmd.colorscheme('undertone')
  end,
}
```

## Configuration

You only need `setup()` if you want to change a default.

```lua
require('undertone').setup({
  -- Which variant `:colorscheme undertone` loads:
  -- 'default', 'ink', 'smoke' or 'paper'.
  variant = 'default',

  -- Use the terminal's own background instead of the theme's.
  transparent = false,

  -- Per-group overrides, as vim.api.nvim_set_hl() specs.
  overrides = {
    -- Comment = { italic = true },
  },
})
vim.cmd.colorscheme('undertone')
```

There's also a matching [lualine](https://github.com/nvim-lualine/lualine.nvim)
theme:

```lua
require('lualine').setup({ options = { theme = 'undertone' } })
```

## Credits

Undertone started as a fork of [yugen.nvim](https://github.com/bettervim/yugen.nvim),
which itself grew out of [poimandres.nvim](https://github.com/olivercederborg/poimandres.nvim).

## License

MIT
