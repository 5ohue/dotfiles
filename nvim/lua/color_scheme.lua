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
    keyword    = { fg = '#4E9A65', bold = false },
    str        = { fg = '#D39A82', bold = false },
    number     = { fg = '#E9B143', bold = false },
    type       = { fg = '#4EC9B0', bold = false },
    parameter  = { fg = '#7F7F7F', bold = false },
    static     = { fg = '#A97FB8', bold = true },
    constant   = { fg = '#82C5C2', bold = true },
    builtin    = { fg = '#569CD6', bold = false },
    member     = { fg = '#7B9150', bold = false },
    enumMember = { fg = '#B8D7A3', bold = false },
    namespace  = { fg = '#B8D7A3', bold = true },
    import     = { fg = '#7F7F7F', bold = false },
    preproc    = { fg = '#7F7F7F', bold = false },

    bracket1   = { fg = '#80D45C', bold = false },
    bracket2   = { fg = '#F2B819', bold = false },
    bracket3   = { fg = '#4EC9B0', bold = false },
}
-------------------------------------------------------------------------------
-- Calling the vim command does not reset all the highlight parameters unlike
-- with `vim.api.nvim_set_hl()`
vim.cmd('hi Normal guibg=#1E1E1E')                                              -- Background

vim.api.nvim_set_hl(0, 'Keyword',                           colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'Number',                            colors.number)      -- Keywords
vim.api.nvim_set_hl(0, 'Float',                             colors.number)      -- Keywords
vim.api.nvim_set_hl(0, 'Boolean',                           colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'Type',                              colors.type)        -- Keywords

-- Treesitter colors
vim.api.nvim_set_hl(0, 'TSKeyword',                         colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSKeywordFunction',                 colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSConditional',                     colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSRepeat',                          colors.keyword)     -- Keywords
vim.api.nvim_set_hl(0, 'TSString',                          colors.str)         -- Strings
vim.api.nvim_set_hl(0, 'TSNumber',                          colors.number)      -- Numbers
vim.api.nvim_set_hl(0, 'TSFloat',                           colors.number)      -- Numbers
vim.api.nvim_set_hl(0, 'TSBoolean',                         colors.keyword)     -- Booleans
vim.api.nvim_set_hl(0, 'TSType',                            colors.type)        -- Types
vim.api.nvim_set_hl(0, 'TSParameter',                       colors.parameter)   -- Function Parameters
vim.api.nvim_set_hl(0, 'TSConstant',                        colors.constant)    -- Constant variables
vim.api.nvim_set_hl(0, 'TSTypeBuiltin',                     colors.builtin)     -- Builtin types
vim.api.nvim_set_hl(0, 'TSProperty',                        colors.member)      -- Class members
vim.api.nvim_set_hl(0, '@variable.member',                  colors.member)      -- Class members
vim.api.nvim_set_hl(0, 'TSNamespace',                       colors.namespace)   -- Namespaces
vim.api.nvim_set_hl(0, 'TSInclude',                         colors.import)      -- Imports
vim.api.nvim_set_hl(0, 'TSPreProc',                         colors.preproc)     -- Preprocessor macros

-- LSP colors
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static',      colors.static)      -- Static variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope', colors.static)      -- Global variables
vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly',    colors.constant)    -- Constant variables
vim.api.nvim_set_hl(0, '@lsp.typemod.enumMember.readonly',  colors.enumMember)  -- Enum members
vim.api.nvim_set_hl(0, '@lsp.mod.declaration',              { bold = true })    -- Declarations

-- Rainbow bracket colors
vim.api.nvim_set_hl(0, 'MyBracket1',                        colors.bracket1)
vim.api.nvim_set_hl(0, 'MyBracket2',                        colors.bracket2)
vim.api.nvim_set_hl(0, 'MyBracket3',                        colors.bracket3)

-- indent-blankline.nvim
vim.api.nvim_set_hl(0, '@ibl.indent.char.1',                { fg = '#2F2E2E' }) -- Indentation
vim.api.nvim_set_hl(0, '@ibl.scope.char.1',                 { fg = '#373533' }) -- Indentation

-- Lsp's semantic tokens for readonly and static have the same priority, which
-- makes the colors inconsistent. Doing the following fixes this.
-- Source: https://neovim.io/doc/user/lsp.html#vim.lsp.semantic_tokens.highlight_token()
vim.api.nvim_set_hl(0, 'MyStatic',                          colors.static)
vim.api.nvim_set_hl(0, 'MyEnumMember',                      colors.enumMember)
vim.api.nvim_create_autocmd('LspTokenUpdate', {
    callback = function(args)
        local token = args.data.token
        if token.type == 'variable' and token.modifiers.static then
            vim.lsp.semantic_tokens.highlight_token(token,
                                                    args.buf,
                                                    args.data.client_id,
                                                    'MyStatic')
        end
        if token.type == 'enumMember' then
            vim.lsp.semantic_tokens.highlight_token(token,
                                                    args.buf,
                                                    args.data.client_id,
                                                    'MyEnumMember')
        end
    end,
})
