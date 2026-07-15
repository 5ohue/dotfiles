-------------------------------------------------------------------------------
local utl = require("utl")
-------------------------------------------------------------------------------

local function namespace_from_filename()
    local name = vim.fn.expand("%:t:r")

    local ns = name:match("^([A-Z][a-z0-9]*)")
    if ns then
        return ns:lower()
    end

    return "XXX"
end

local function concat(...)
    local result = {}
    for _, t in ipairs({ ... }) do
        vim.list_extend(result, t)
    end
    return result
end

-------------------------------------------------------------------------------

local function template_start()
    local line = utl.get_line_separator()
    local cp = utl.comment_prefix()

    return {
        line,
        string.format("%s File:    '%s'", cp, utl.filename()),
        string.format("%s Created: %s", cp, utl.current_datetime()),
        cp,
        string.format("%s Copyright (c) %s Cosmographic Software LLC.", cp, utl.current_year()),
        line,
    }
end

local function template_end()
    return {
        utl.get_line_separator("End of file")
    }
end

-------------------------------------------------------------------------------

vim.api.nvim_create_user_command("InsertHeaderTemplate", function()
    local ns = namespace_from_filename()

    local lines = concat(
        template_start(),
        {
            "#pragma once",
            "",
            "// Includes:",
            "",
            string.format("namespace %s", ns),
            "{",
            "",
            "// Forward declarations:",
            "",
            "// Classes:",
            "",
            "",
            "",
            string.format("}; // namespace %s", ns),
            "",
        },
        template_end()
    )

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, {})

vim.api.nvim_create_user_command("InsertImplTemplate", function()
    local ns = namespace_from_filename()
    local header = vim.fn.expand("%:t:r") .. ".h"

    local lines = concat(
        template_start(),
        {
            "",
            "// Includes:",
            '#include "pch.h"',
            string.format('#include "%s"', header),
            "",
            "// Implementation:",
            string.format("namespace %s", ns),
            "{",
            "",
            "",
            "",
            string.format("}; // namespace %s", ns),
            "",
        },
        template_end()
    )

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end, {})

-------------------------------------------------------------------------------

vim.api.nvim_create_user_command('ChangeNamespace',
    function(args)
        local vim_cmd = '%s/namespace \\w*/namespace '
        if (args['fargs'][1]) then
            vim_cmd = vim_cmd .. args['fargs'][1] .. '/eg'
        else
            return
        end
        vim.cmd(vim_cmd)
        vim.cmd('nohl')
    end, { nargs = 1 })

-------------------------------------------------------------------------------
