-- Use pretty colors
vim.opt.termguicolors = true

-- Configure gruvbox-material colorscheme
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_bold = 1
-- Set gruvbox-material colorscheme
vim.cmd.colorscheme 'gruvbox-material'

-------------------------------------------------------------------------------
-- My own custom colors
local colors = {
    keyword    = { fg = '#4E9A65', },
    string     = { fg = '#E69675' },
    number     = { fg = '#E9B143' },
    type       = { fg = '#4EC9B0' },
    parameter  = { fg = '#7F7F7F' },
    static     = { fg = '#A97FB8', bold = true },
    constant   = { fg = '#82C5C2', bold = true },
    builtin    = { fg = '#569CD6', bold = true },
    enumMember = { fg = '#B8D7A3' },
    namespace  = { fg = '#B8D7A3', bold = true },
    import     = { fg = '#B183C2', bold = true },
}
-------------------------------------------------------------------------------
-- Treesitter colors
vim.api.nvim_set_hl(0, 'TSKeyword',                         colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSKeywordFunction',                 colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSConditional',                     colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSRepeat',                          colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSString',                          colors.string)      -- Strings
vim.api.nvim_set_hl(0, 'TSNumber',                          colors.number)      -- Numbers
vim.api.nvim_set_hl(0, 'TSFloat',                           colors.number)      -- Numbers
vim.api.nvim_set_hl(0, 'TSBoolean',                         colors.keyword)     -- Booleans
vim.api.nvim_set_hl(0, 'TSType',                            colors.type)        -- Types
vim.api.nvim_set_hl(0, 'TSParameter',                       colors.parameter)   -- Function Parameters
vim.api.nvim_set_hl(0, 'TSConstant',                        colors.constant)    -- Constant variables
vim.api.nvim_set_hl(0, 'TSTypeBuiltin',                     colors.builtin)     -- Builtin types
vim.api.nvim_set_hl(0, 'TSNamespace',                       colors.namespace)   -- Namespaces
vim.api.nvim_set_hl(0, 'TSInclude',                         colors.import)      -- Imports

-- LSP colors
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static',      colors.constant)    -- Static variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly',    colors.constant)    -- Constant variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope', colors.constant)    -- Global variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.fileScope',   colors.constant)    -- Static "local" variables
vim.api.nvim_set_hl(0, '@lsp.typemod.enumMember.readonly',  colors.enumMember)  -- Enum members
vim.api.nvim_set_hl(0, '@lsp.mod.declaration',              { bold = true })    -- Declarations

-- Rainbow bracket colors
vim.api.nvim_set_hl(0, 'RainbowDelimiterRed',               { fg = '#F2594B'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen',             { fg = '#80D45C'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange',            { fg = '#FF8A33'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan',              { fg = '#4FB7C8'})

-- indent-blankline.nvim
vim.api.nvim_set_hl(0, '@ibl.indent.char.1',                { fg = '#2F2E2E' }) -- Indentation
vim.api.nvim_set_hl(0, '@ibl.scope.char.1',                 { fg = '#373533' }) -- Indentation
