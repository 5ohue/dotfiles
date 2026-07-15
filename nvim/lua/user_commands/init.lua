-------------------------------------------------------------------------------
require("user_commands.se")
local utl = require("utl")
-------------------------------------------------------------------------------

vim.api.nvim_create_user_command("ReloadConfig",
    function()
        vim.cmd("source $MYVIMRC")
        vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
    end, { desc = "Reload init.lua and plugins" })

vim.api.nvim_create_user_command("CdHere",
    function()
        local dir = vim.fn.expand("%:p:h")
        if dir ~= "" then
            vim.cmd("cd " .. dir)
            vim.notify("CD to: " .. dir)
        end
    end, { desc = "Change working directory to the current file's folder" })

-- Text Editing ---------------------------------------------------------------

vim.api.nvim_create_user_command('RemoveTrailingWhiteSpace', utl.remove_trail_whitespace, {})

-- Line Separators ------------------------------------------------------------

vim.api.nvim_create_user_command('InsertLineSeparator',
    function(args)
        local line = utl.get_line_separator(args.fargs[1])

        vim.api.nvim_put({ line }, "l", true, true)
    end,
    { nargs = "?" })

vim.api.nvim_create_user_command('FixLineSeparators', utl.fix_line_separators, {})

-------------------------------------------------------------------------------
