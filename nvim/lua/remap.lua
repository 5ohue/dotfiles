local map = vim.keymap.set

vim.g.mapleader = ' '

-- Quit
map('n', '<leader>q', ':q<CR>',  { desc = '[Q]uit the current file' })
map('n', '<leader>Q', ':q!<CR>', { desc = '[Q!]uit the current file' })

-- 'x' means visual mode
map({'n', 'x'}, '<leader>cy', '"+y', { desc = 'System [c]lipboard: [y]ank'  })
map({'n', 'x'}, '<leader>cp', '"+p', { desc = 'System [c]lipboard: [p]aste' })
map({'n', 'x'}, '<leader>p', '"_dP', { desc = '[P]aste without yanking' })
map({'n', 'x'}, '<leader>d', '"_d', { desc = '[d]elete without yanking' })
map({'n', 'x'}, '<leader>D', '"_D', { desc = '[D]elete without yanking' })

-- Don't yank text deleted with 'x'
map({'n', 'x'}, 'x', '"_x')

map('n', '<TAB>',   '<cmd>bnext<cr>')
map('n', '<S-TAB>', '<cmd>bprevious<cr>')

-- Resize windows
map('n', '<C-Up>', ':resize +2<CR>', { desc = 'Increase window height' })
map('n', '<C-Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
map('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
map('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

-- Splits
map('n', '<leader>sv', '<C-w>v')   -- vertical split
map('n', '<leader>sh', '<C-w>s')   -- horizontal split
map('n', '<leader>se', '<C-w>=')   -- make equal size
map('n', '<leader>sx', '<cmd>close<CR>') -- close current split

-- Move selected lines up/down
map('v', 'gj', ":m '>+1<CR>gv=gv")
map('v', 'gk', ":m '>-2<CR>gv=gv")

-- Keep selection after indenting
map('v', '<', '<gv', { desc = 'Indent left and keep selection' })
map('v', '>', '>gv', { desc = 'Indent right and keep selection' })

-- Increment/decrement numbers
map('n', '+', '<C-a>', { desc = 'Increment number' })
map('n', '-', '<C-x>', { desc = 'Decrement number' })

-- n - go to the next search match
-- zz - center the current line in the window
-- zv - open the fold under the cursor if it is folded
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keep cursor centered when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- Don't higlight search matches
map('n', '<leader>nh', ':nohl<CR>', { desc = '[N]o [H]ighlight'})

-- Replace word under cursor
map('n', '<leader>cw', ':%s/\\<<C-R><C-W>\\>/', { desc = '[C]hange [W]ord' })
map('n', '<leader>cW', ':%s/<C-R><C-A>/',       { desc = '[C]hange BIG [W]ord' })
