local M = {}

-- Highlight groups, as specs for vim.api.nvim_set_hl().
-- Groups not listed here keep their Neovim defaults, which mostly
-- link back to the standard groups defined below.
---@param p table the undertone palette
---@param opts table resolved options from undertone.setup()
function M.get(p, opts)
  local bg = opts.transparent and p.none or p.bg

  return {
    -- editor chrome
    Normal = { fg = p.fg, bg = bg },
    NormalFloat = { fg = p.fg, bg = bg },
    NormalNC = { fg = p.fg, bg = bg },
    FloatBorder = { fg = p.overlay },
    FloatTitle = { fg = p.fg },
    WinSeparator = { fg = p.overlay, bg = bg },
    VertSplit = { fg = p.overlay },
    ColorColumn = { bg = p.surface },
    Conceal = { fg = p.fg },
    Cursor = { fg = p.bg, bg = p.fg },
    CursorLine = { bg = p.overlay },
    CursorColumn = { bg = bg },
    LineNr = { fg = p.faint },
    CursorLineNr = { fg = p.subtle },
    SignColumn = { fg = p.fg },
    Directory = { fg = p.subtle },
    Title = { fg = p.fg },
    NonText = { fg = p.faint },
    Whitespace = { fg = p.surface },
    SpecialKey = { fg = p.fg },
    Folded = { fg = p.fg, bg = bg },
    FoldColumn = { fg = p.fg },
    MatchParen = { fg = p.fg, bg = p.surface },

    -- search and selection
    Visual = { fg = p.fg, bg = p.overlay },
    Search = { fg = p.fg, bg = p.overlay },
    IncSearch = { fg = p.fg, bg = p.overlay },
    CurSearch = { link = 'IncSearch' },
    WildMenu = { link = 'IncSearch' },

    -- popup menu
    Pmenu = { fg = p.fg, bg = p.surface },
    PmenuSel = { fg = p.fg, bg = p.muted },
    PmenuSbar = { bg = p.surface },
    PmenuThumb = { bg = p.overlay },

    -- statusline and tabline
    StatusLine = { fg = p.fg, bg = bg },
    StatusLineNC = { fg = p.fg, bg = bg },
    TabLine = { fg = p.fg },
    TabLineFill = { bg = bg },
    TabLineSel = { fg = p.fg, bg = bg },

    -- messages
    ErrorMsg = { fg = p.error, bold = true },
    WarningMsg = { fg = p.warning },
    ModeMsg = { fg = p.fg },
    MoreMsg = { fg = p.fg },
    Question = { fg = p.warning },

    -- diffs
    DiffAdd = { bg = p.surface },
    DiffDelete = { bg = p.surface },
    DiffChange = { fg = p.fg, bg = p.surface },
    DiffText = { bg = p.surface },
    diffAdded = { link = 'DiffAdd' },
    diffChanged = { link = 'DiffChange' },
    diffRemoved = { link = 'DiffDelete' },

    -- spelling
    SpellBad = { sp = p.error, undercurl = true },
    SpellCap = { sp = p.blue, undercurl = true },
    SpellLocal = { sp = p.warning, undercurl = true },
    SpellRare = { sp = p.blue, undercurl = true },

    -- quickfix
    qfFileName = { fg = p.fg },
    qfLineNr = { fg = p.fg },

    -- core syntax
    Comment = { fg = p.faint },
    Constant = { fg = p.teal },
    String = { fg = p.green },
    Character = { fg = p.green },
    Number = { fg = p.teal },
    Boolean = { fg = p.teal },
    Float = { fg = p.teal },
    Identifier = { fg = p.fg },
    Function = { fg = p.peach },
    Statement = { fg = p.fg },
    Keyword = { fg = p.purple },
    Operator = { fg = p.muted },
    PreProc = { fg = p.fg },
    Include = { fg = p.peach },
    Type = { fg = p.blue },
    Special = { fg = p.fg },
    Tag = { fg = p.peach },
    Delimiter = { fg = p.fg },
    SpecialComment = { fg = p.faint },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },

    -- treesitter
    -- (unlisted captures fall back to their parent capture, then to core syntax)
    ['@variable'] = { fg = p.fg },
    ['@variable.builtin'] = { fg = p.blue },
    ['@variable.parameter'] = { fg = p.fg },
    ['@variable.member'] = { fg = p.subtle },
    ['@property'] = { fg = p.subtle },
    ['@constant.builtin'] = { fg = p.teal },
    ['@string.escape'] = { fg = p.teal },
    ['@constructor'] = { fg = p.faint },
    ['@function.builtin'] = { fg = p.peach },
    ['@keyword.import'] = { fg = p.muted },
    ['@keyword.export'] = { fg = p.muted },
    ['@operator'] = { fg = p.muted },
    ['@punctuation'] = { fg = p.faint },
    ['@punctuation.bracket'] = { fg = p.muted },
    ['@label'] = { fg = p.faint },
    ['@tag'] = { fg = p.peach },
    ['@tag.delimiter'] = { fg = p.muted },
    ['@tag.attribute'] = { fg = p.subtle, italic = true },
    ['@markup.heading'] = { fg = p.muted, bold = true },

    -- custom captures from after/queries/typescript/highlights.scm
    ['@constant.falsy'] = { fg = p.peach },
    ['@import.identifier'] = { fg = p.subtle },

    -- diagnostics
    -- (sign, virtual text and float variants link to these by default)
    DiagnosticError = { fg = p.error },
    DiagnosticWarn = { fg = p.warning },
    DiagnosticInfo = { fg = p.fg },
    DiagnosticHint = { fg = p.success },
    DiagnosticUnderlineError = { sp = p.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = p.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = p.fg, undercurl = true },
    DiagnosticUnderlineHint = { sp = p.success, undercurl = true },

    -- lsp
    LspReferenceText = { bg = p.bg },
    LspReferenceRead = { bg = p.bg },
    LspReferenceWrite = { bg = p.bg },
    LspCodeLens = { fg = p.fg },
    LspSignatureActiveParameter = { bg = p.overlay },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = p.success },
    GitSignsChange = { fg = p.warning },
    GitSignsDelete = { fg = p.error },

    -- lukas-reineke/indent-blankline.nvim
    IblIndent = { fg = p.overlay },
    IblScope = { fg = p.bright },

    -- folke/which-key.nvim
    WhichKey = { fg = p.fg },
    WhichKeyGroup = { fg = p.fg },
    WhichKeyDesc = { fg = p.fg },
    WhichKeySeparator = { fg = p.faint },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = p.fg },
    CmpItemAbbrDeprecated = { fg = p.surface, strikethrough = true },
    CmpItemAbbrMatch = { fg = p.subtle },
    CmpItemAbbrMatchFuzzy = { fg = p.bright },
    CmpItemKind = { fg = p.peach },

    -- nvim-telescope/telescope.nvim
    TelescopeNormal = { fg = p.fg },
    TelescopeBorder = { fg = p.overlay },
    TelescopeTitle = { fg = p.fg },
    TelescopeSelection = { fg = p.fg, bg = p.surface },
    TelescopeMatching = { fg = p.peach },
    TelescopePromptBorder = { fg = p.surface },
    TelescopePromptNormal = { fg = p.bright },
    TelescopePromptPrefix = { fg = p.fg },
    TelescopePromptTitle = { fg = p.bright, bg = p.surface },
    TelescopePreviewTitle = { fg = p.bright, bg = p.surface },
  }
end

return M
