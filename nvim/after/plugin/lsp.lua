vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = ev.buf, desc = 'LSP: ' .. desc })
        end

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Find references for the word under your cursor.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace
        --  Similar to document symbols, except searches over your whole project.
        map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a code action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- WARN: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- -- Buffer local mappings.
        -- -- See `:help vim.lsp.*` for documentation on any of the below functions
        -- vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration,             { buffer = ev.buf })
        -- vim.keymap.set('n', 'gd',         vim.lsp.buf.definition,              { buffer = ev.buf })
        -- vim.keymap.set('n', 'K',          vim.lsp.buf.hover,                   { buffer = ev.buf })
        -- vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation,          { buffer = ev.buf })
        -- vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help,          { buffer = ev.buf })
        --
        -- -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,    { buffer = ev.buf })
        -- -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { buffer = ev.buf })
        -- -- vim.keymap.set('n', '<leader>wl',
        -- -- function(args)
        -- --     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- -- end,
        -- -- { buffer = ev.buf })
        --
        -- vim.keymap.set('n', '<leader>D',  vim.lsp.buf.type_definition,      { buffer = ev.buf, desc = 'Type [D]efinition' })
        -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,               { buffer = ev.buf, desc = '[R]e[N]ame symbol' })
        -- vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = '[C]ode [A]ction' })
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf })
        -- vim.keymap.set({ 'n', 'v' }, '<leader>f',
        -- function()
        --     local format_args = {
        --         async = true,
        --     }
        --     vim.lsp.buf.format(format_args)
        -- end, { buffer = ev.buf, desc = '[F]ormat' })
        -- vim.api.nvim_create_user_command('For',
        -- function(args)
        --     local format_args = {
        --         async = true,
        --     }
        --     print(args.line1)
        --     -- format_args['start'] = { args.line1, 0 }
        --     -- format_args['end']   = { args.line2, 0 }
        --     vim.lsp.buf.format(format_args)
        -- end, {})

        -- Litee stuff
        vim.keymap.set('n', '<leader>s',  vim.lsp.buf.document_symbol, { buffer = ev.buf, desc = 'List [s]ymbols' })
        vim.keymap.set('n', '<leader>ci', vim.lsp.buf.incoming_calls,  { buffer = ev.buf, desc = '[C]alls: [i]ncoming' })
        vim.keymap.set('n', '<leader>co', vim.lsp.buf.outgoing_calls,  { buffer = ev.buf, desc = '[C]alls: [o]utcoming' })
    end,
}
)
