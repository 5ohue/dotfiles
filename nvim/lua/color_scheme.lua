-- Use pretty colors
vim.opt.termguicolors = true

-- Load custom palette
local palette = require('palettes.darktooth')
require('nova_cs_theme_example').set_palette(palette)

-- Set colorscheme
vim.cmd.colorscheme 'nova_cs_theme_example'

-- Set lualine colorscheme
require('lualine').setup { options = { theme = require('nova_cs_theme_example').lualine } }

-- Lsp's semantic tokens for readonly and static have the same priority, which
-- makes the colors inconsistent. Doing the following fixes this.
-- Source: https://neovim.io/doc/user/lsp.html#vim.lsp.semantic_tokens.highlight_token()
vim.api.nvim_create_autocmd('LspTokenUpdate', {
    callback = function(args)
        local token = args.data.token
        if token.type == 'variable' and token.modifiers.static then
            vim.lsp.semantic_tokens.highlight_token(token,
                                                    args.buf,
                                                    args.data.client_id,
                                                    '@lsp.typemod.variable.static')
        end
        if token.type == 'enumMember' then
            vim.lsp.semantic_tokens.highlight_token(token,
                                                    args.buf,
                                                    args.data.client_id,
                                                    '@lsp.typemod.enumMember.readonly')
        end
    end,
})
