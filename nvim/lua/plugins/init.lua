local editor = require('plugins.editor')
local colorschemes = require('plugins.colorschemes')
local lsp = require('plugins.lsp')
local other = require('plugins.other')

require('lazy').setup({ editor, lsp, colorschemes, other })
