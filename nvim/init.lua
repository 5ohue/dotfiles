require 'set'
require 'remap'
require 'user_commands'

require 'init_lazy'     -- Initialize(install) lazy plugin manager
require 'plugins'       -- Install all needed plugins using Lazy
                        -- (contains plugin descriptions)

-- Set the color scheme
vim.opt.termguicolors = true
-- vim.cmd("let g:gruvbox_material_background = 'hard'")
vim.cmd("let g:gruvbox_material_foreground = 'mix'")
vim.cmd("let g:gruvbox_material_better_performance = 1")
vim.cmd("let g:gruvbox_material_enable_bold = 1")
vim.cmd.colorscheme 'gruvbox-material'
-- vim.cmd("let g:gruvbox_contrast_dark = 'hard'")
-- vim.cmd("let g:gruvbox_invert_selection = '0'")
-- vim.cmd.colorscheme 'gruvbox'
