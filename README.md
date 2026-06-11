# undertone

A near-monochrome dark theme for Neovim. The base is a warm gray ramp on a
near-black background. Strings, keywords, types, constants and functions get
muted pastels; everything else stays gray.

## Palette

| Role                | Color     |
| ------------------- | --------- |
| Functions, tags     | `#F5C49C` |
| Strings             | `#AFC79E` |
| Keywords            | `#BCA8C9` |
| Types               | `#A5B8CC` |
| Constants, numbers  | `#9CC4B2` |

## Installation

### vim.pack (Neovim 0.12+)

```lua
vim.pack.add({ 'https://github.com/<your-name>/undertone.nvim' })
vim.cmd.colorscheme('undertone')
```

### lazy.nvim

```lua
{
  '<your-name>/undertone.nvim',
  config = function()
    vim.cmd.colorscheme('undertone')
  end,
}
```

## Configuration

You only need `setup()` if you want to change a default.

```lua
require('undertone').setup({
  -- Use the terminal's own background instead of the theme's near-black.
  transparent = false,

  -- Per-group overrides, as vim.api.nvim_set_hl() specs.
  overrides = {
    -- Comment = { fg = '#808080', italic = true },
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

undertone started as a fork of [yugen.nvim](https://github.com/bettervim/yugen.nvim),
which itself grew out of [poimandres.nvim](https://github.com/olivercederborg/poimandres.nvim).
Thanks to both.

## License

MIT
