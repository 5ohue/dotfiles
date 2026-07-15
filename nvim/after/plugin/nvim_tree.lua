require('nvim-tree').setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    view = {
        side = 'right',
        relativenumber = true,
    },
})

vim.api.nvim_create_user_command('Sex', 'NvimTreeOpen', {})

vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvim [T]ree: [T]oggle' })
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFocus<CR>' , { desc = 'Nvim [T]ree: [F]ocus' })
