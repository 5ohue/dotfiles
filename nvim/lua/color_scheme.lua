-- Use pretty colors
vim.opt.termguicolors = true

-- Function to change nova cs theme
function set_colorscheme(palette_name)
    local palette = require('palettes.' .. palette_name)

    require('nova_cs_theme_example').set_palette(palette)

    -- Set colorscheme
    vim.cmd.colorscheme 'nova_cs_theme_example'

    -- Set lualine colorscheme
    require('lualine').setup { options = { theme = require('nova_cs_theme_example').lualine } }
end
-- ':NovaCS darktooth' to change nova cs palette
vim.api.nvim_create_user_command(
    'NovaCS',
    function(args)
        set_colorscheme(args['fargs'][1])
    end,
    {
        nargs = 1
    }
)

-- Set colorscheme
set_colorscheme('darktooth')



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

--
