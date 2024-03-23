-- This module contains a number of default definitions
local rainbow_delimiters = require 'rainbow-delimiters'

---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim  = rainbow_delimiters.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterYellow',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterBlue',
        'RainbowDelimiterCyan',
        'RainbowDelimiterViolet',
        'RainbowDelimiterRed',
    },
}

-- Change colors
vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = '#FF8A33'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan',   { fg = '#4FB7C8'})
vim.api.nvim_set_hl(0, 'RainbowDelimiterRed',    { fg = '#F2594B'})
