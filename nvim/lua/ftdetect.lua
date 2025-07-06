vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
    pattern = { '*.cmp', '*.pst', '*.stats' },

    callback = function()
        vim.cmd('set filetype=se_cfg')
    end,
})
