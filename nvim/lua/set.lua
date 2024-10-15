local uname = vim.loop.os_uname()

_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

-- Enable spell checking
vim.cmd("setlocal spell spelllang=ru_ru,en_us")

-- Highlight a line where the curser is at
vim.opt.cursorline = true

-- Enable mouse support
vim.opt.mouse = 'a'

-- Enable relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Name of window will be the name of file
vim.opt.title = true

-- Enhanced command line completion
vim.opt.wildmenu = true

-- Break long lines
-- vim.opt.wrap = true
vim.opt.wrap = false
-- Don't break lines in the middle of a word
-- vim.opt.linebreak = true

-- Configure tab sizes
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
-- Do not insert \t character when hiting TAB
vim.opt.expandtab   = true
-- (0  --- Indent by opening round bracket
-- N-s --- Namespaces do not indent
-- g0  --- no identation inside class
vim.opt.cinoptions  = "(0,N-s,g0,i0"

-- Add side column
vim.opt.colorcolumn = "80"

-- Cursor will not be at very top/bottom of screen
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- Display tab characters and trailing whitespace
vim.opt.list = true
vim.opt.listchars = {tab = '>~', trail = '·', precedes = '#'}

-- Do not highlight previously searched words indefinetely
-- vim.opt.hlsearch = false

-- No delay when switching between modes
vim.opt.ttimeoutlen = 0

-- I do have a nerd font
vim.g.have_nerd_font = true

-- Something primeagen did with his swap file
if _G.IS_LINUX then
    vim.opt.swapfile = false
    vim.opt.backup   = false
    vim.opt.undodir  = os.getenv("HOME") .. "/.vim/undodir"
    vim.opt.undofile = true

    -- Don't use fish shell
    vim.shell = '/bin/bash'
end
