vim.g.mapleader = ','

vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = '[Q]uit the current file' })
vim.keymap.set('n', '<leader>w', ':ret<CR>:RemoveLongLineComments<CR>:RemoveTrailingWhiteSpace<CR>:w<CR>', { desc = '[W]rite current file' })

vim.keymap.set({'n', 'x'}, '<leader>cy', '"+y', { desc = 'System [c]lipboard: [y]ank'  })
vim.keymap.set({'n', 'x'}, '<leader>cp', '"+p', { desc = 'System [c]lipboard: [p]aste' })

vim.keymap.set({'n', 'x'}, 'x', '"_x') -- `x` does not mess with registers

vim.keymap.set('n', '<TAB>',   '<cmd>bnext<cr>')
vim.keymap.set('n', '<S-TAB>', '<cmd>bprevious<cr>')

vim.keymap.set('v', 'gj', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'gk', ":m '>-2<CR>gv=gv")

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Greatest remap ever
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[p]aste without yanking the deleted text' })

-- vim-bbye remap
vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<CR>')
vim.keymap.set('n', '<leader>bD', '<cmd>Bdelete!<CR>')

-- nvim-tree remaps
vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvim [T]ree: [T]oggle' })
vim.keymap.set('n', '<leader>to', '<cmd>NvimTreeOpen<CR>'  , { desc = 'Nvim [T]ree: [O]pen' })
vim.keymap.set('n', '<leader>tc', '<cmd>NvimTreeClose<CR>' , { desc = 'Nvim [T]ree: [C]lose' })
vim.keymap.set('n', '<leader>tf', '<cmd>NvimTreeFocus<CR>' , { desc = 'Nvim [T]ree: [F]ocus' })
