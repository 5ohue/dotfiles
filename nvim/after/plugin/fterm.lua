local fterm = require("FTerm")

-- Switch from terminal mode to normal mode
vim.keymap.set('t', '<C-A>', '<C-\\><C-N>')

---- Terminals ----
-- Default terminal
fterm.setup({
    border = 'double',
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
})

-- Lazygit terminal
local lazygit = fterm:new({
    ft = 'fterm_lazygit',
    cmd = "lazygit",
    dimensions = {
        height = 0.9,
        width = 0.9
    }
})

---- Terminal Toggling ----
-- keymap helper
function toggle_keymap(keys, toggle_fn, description)
    vim.keymap.set('n', '<leader>' .. keys, toggle_fn, { desc = description })
    vim.keymap.set('t', '<leader>' .. keys, function() toggle_fn() end)
end

toggle_keymap('ft', fterm.toggle, '[F]Term [T]oggle')
toggle_keymap('fg', function() lazygit:toggle() end, '[F]Term [G]it')
