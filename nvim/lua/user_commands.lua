vim.api.nvim_create_user_command('InsertDate', ':r !date -u +"\\%d.\\%m.\\%Y \\%H:\\%M:\\%S"', {})
vim.api.nvim_create_user_command(
    'InsertTemplateData',
    "norm ggo File:    '<ESC>\"%p:InsertDate<CR>Di// Created: <ESC>p6byw2j03Elp2G$F/dT'xGddgg",
    {}
)
vim.api.nvim_create_user_command('InsertHeaderTemplate', 'norm gg:0r !cat ~/.git-clones/misc/SE/Header.txt<CR>:InsertTemplateData<CR>', {})
vim.api.nvim_create_user_command('InsertImplTemplate',   'norm gg:0r !cat ~/.git-clones/misc/SE/Impl.txt<CR>:InsertTemplateData<CR>',   {})
vim.api.nvim_create_user_command(
    'ChangeNamespace',
    function(args)
        local vimCmd = '%s/namespace \\w*/namespace '
        if (args['fargs'][1]) then
            vimCmd = vimCmd .. args['fargs'][1] .. '/eg'
        else
            return
        end
        vim.cmd(vimCmd)
        vim.cmd('nohl')
    end,
    {
        nargs = 1
    }
)
vim.api.nvim_create_user_command('InsertLineSeparator', 'norm I//<ESC>a-<ESC>76.', {})
vim.api.nvim_create_user_command('RemoveLongLineComments', ':%s/\\/\\/\\(.\\{50\\}\\)---------*$/\\/\\/\\1---------------------------/e', {})

vim.api.nvim_create_user_command(
    'RemoveTrailingWhiteSpace',
    '%s/\\s\\+$//e',
    {}
)

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})
