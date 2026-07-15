vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('BufWritePre', { callback = require("utl").remove_trail_whitespace, })

-- Lsp's semantic tokens for readonly and static have the same priority, which
-- makes the colors inconsistent. Doing the following fixes this.
-- Source: https://neovim.io/doc/user/lsp.html#vim.lsp.semantic_tokens.highlight_token()
vim.api.nvim_create_autocmd('LspTokenUpdate', {
    callback = function(args)
        local token = args.data.token
        if token.type == 'variable' and token.modifiers.static then
            vim.lsp.semantic_tokens.highlight_token(
                token, args.buf, args.data.client_id,
                '@lsp.typemod.variable.static'
            )
        end
        if token.type == 'variable' and token.modifiers.globalScope then
            vim.lsp.semantic_tokens.highlight_token(
                token, args.buf, args.data.client_id,
                '@lsp.typemod.variable.static'
            )
        end
        if token.type == 'enumMember' then
            vim.lsp.semantic_tokens.highlight_token(
                token, args.buf, args.data.client_id,
                '@lsp.typemod.enumMember.readonly'
            )
        end
    end,
})
