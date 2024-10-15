require'FTerm'.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

vim.keymap.set('n', '<leader>ft', require('FTerm').toggle, { desc = '[F]Term [T]oggle' })
vim.keymap.set('t', '<C-A>', '<C-\\><C-N>')
