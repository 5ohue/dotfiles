-- Use pretty colors
vim.opt.termguicolors = true

-- Configure gruvbox-material colorscheme
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_bold = 1
-- Set gruvbox-material colorscheme
vim.cmd.colorscheme 'gruvbox-material'

-------------------------------------------------------------------------------
-- My own custom colors
-------------------------------------------------------------------------------
-- Treesitter colors
vim.api.nvim_set_hl(0, 'TSParameter',                       { fg = '#4E9A65'})              -- Function Parameters

-- LSP colors
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static',      { fg = '#A97FB8', bold = true}) -- Static variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope', { fg = '#82C5C2', bold = true}) -- Global variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.fileScope',   { fg = '#82C5C2', bold = true}) -- Static "local" variables

-- Rainbow bracket colors
vim.api.nvim_set_hl(0, 'RainbowDelimiterRed',               { fg = '#F2594B'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen',             { fg = '#80D45C'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange',            { fg = '#FF8A33'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan',              { fg = '#4FB7C8'})
