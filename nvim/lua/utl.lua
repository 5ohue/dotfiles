-------------------------------------------------------------------------------
local M = {}
-- Variables ------------------------------------------------------------------

local uname = vim.loop.os_uname()

M.os = uname.sysname
M.is_mac = M.os == 'Darwin'
M.is_linux = M.os == 'Linux'
M.is_windows = M.os:find('Windows') and true or false
M.is_wsl = M.is_linux and uname.release:find('Microsoft') and true or false

M.projects_dir = "~/Projects/"
M.line_width = 79

-- Functions ------------------------------------------------------------------

M.current_datetime = function()
    return os.date("%d.%m.%Y %H:%M:%S")
end

M.current_year = function()
    return os.date("%Y")
end

M.filename = function()
    return vim.fn.expand("%:t")
end

M.remove_trail_whitespace = function()
    vim.cmd('let tmp = winsaveview()')
    vim.cmd('%s/\\s\\+$//e')
    vim.cmd('nohl')
    vim.cmd('call winrestview(tmp)')
end

-- Thanks ChatGPT!
M.comment_prefix = function()
    local cs = vim.bo.commentstring
    return (cs:gsub("%%s.*", "")):gsub("%s+$", "")
end

M.get_line_sep_char = function(cp)
    return ({
        ['//'] = '-',
        ['--'] = '-',
        ['#']  = '=',
        ['%']  = '=',
        ['"']  = '"',
    })[cp]
end

M.get_line_separator = function(text)
    local cp = M.comment_prefix()
    local sep = M.get_line_sep_char(cp)

    if not sep then
        return ""
    end

    local function fill_sep(pre)
        return pre .. string.rep(sep, math.max(0, M.line_width - #pre))
    end

    if not text then
        return fill_sep(cp)
    end

    local s = cp .. ' ' .. text .. ' '
    return fill_sep(s)
end

M.fix_line_separators = function()
    local cp = M.comment_prefix()
    local sep = M.get_line_sep_char(cp)

    if not sep then
        return
    end

    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

    local sep_20 = sep:rep(20)
    local sep_width = sep:rep(M.line_width)

    for i, line in ipairs(lines) do
        local run = line:match(vim.pesc(sep) .. "+$")
        if run and #run >= 20 then
            lines[i] = (line .. sep_width):sub(1, M.line_width)
        end
    end

    vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
end

-------------------------------------------------------------------------------
return M
-------------------------------------------------------------------------------
