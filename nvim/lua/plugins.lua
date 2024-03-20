require('lazy').setup({
    -- Add colorful icons
    {'nvim-tree/nvim-web-devicons'},
    -- Adds different useful lua functions (used by some plugins)
    {'nvim-lua/plenary.nvim'},
    -- Status line at the bottom of neovim screen
    {'nvim-lualine/lualine.nvim'},
    -- A plugin that shows tabs at the top
    {'akinsho/bufferline.nvim'},
    -- Tab identation helper
    {'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}},
    -- Comment lines using `gc` command
    {'numToStr/Comment.nvim'},
    -- Fuzzy file finder
    {'nvim-telescope/telescope.nvim'},
    -- Expands on `di'` type of commands
    {'wellle/targets.vim'},
    -- Command `cs"'` changes a pair of "" to a pair of ''
    -- This plugin also allows to quickly add parens around words
    -- (in visual mode press 'S)' to wrap with parens)
    {'tpope/vim-surround'}, -- Git integration inside neovim
    {'tpope/vim-fugitive'},
    -- Git decorations inside neovim
    {'lewis6991/gitsigns.nvim'},
    -- :BDelete command that deletes a buffer without closing a window
    {'moll/vim-bbye'},
    -- Automatically add matching parens
    {'jiangmiao/auto-pairs'},
    -- File tree like in good ol' IDEs
    {'nvim-tree/nvim-tree.lua'},
    -- Floating terminal windows
    {'numToStr/FTerm.nvim'},
    -- Navigate the undo history (magic!!!)
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        keys = {
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        }
    },
    -- Show markdown presentations in nvim
    {
        "sotte/presenting.nvim",
        opts = {
            -- fill in your options here
            -- see :help Presenting.config
        },
        cmd = { "Presenting" },
    },
    -- Preview markdown in browser
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- Useful plugin to show you pending keybinds.
    {
        'folke/which-key.nvim',
        event = 'VimEnter', -- Sets the loading event to 'VimEnter'
        config = function() -- This is the function that runs, AFTER loading
            require('which-key').setup()

            -- Document existing key chains
            -- require('which-key').register {
            --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
            --     ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
            --     ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
            --     ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
            --     ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
            -- }
        end,
    },
    {'HiPhish/rainbow-delimiters.nvim'},
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Color themes
    {'5ohue/atlasue.vim'}, -- My own color scheme!!!
    {'rebelot/kanagawa.nvim'},
    {'kxzk/skull-vim'},
    {'xero/miasma.nvim'},
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup{}
            require('bamboo').load()
        end,
    },
    {'miikanissi/modus-themes.nvim'},
    {'bdesham/biogoo'},
    {'noahfrederick/vim-noctu'},
    {'tomasiser/vim-code-dark'},
    {'fneu/breezy'},
    {'dikiaap/minimalist'},
    {'morhetz/gruvbox'},
    {'sainnhe/gruvbox-material'},

    -- LSP stuff
    ---- LSP support
    {'neovim/nvim-lspconfig'},
    --- Autocompletion
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    ---- Snippets
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'},
    ---- Other
    {'jose-elias-alvarez/null-ls.nvim'},
    {'jayp0521/mason-null-ls.nvim'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = {
            -- options
        },
    },
    {'lervag/vimtex'},
    -- Litee is a plugin library used for some neat LSP stuff
    {'ldelossa/litee.nvim'},
    -- `,s` to show the symbols in the file
    {'ldelossa/litee-symboltree.nvim'},
    -- Show the call tree
    {'ldelossa/litee-calltree.nvim'},
    {
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
            })
        end
    },
    -- Highlight all the symbols that are under the cursor
    {'RRethy/vim-illuminate'},
    -- A pretty list for showing diagnostics, references, telescope results and location lists to help you solve all the trouble your code is causing.
    {'folke/trouble.nvim'},
    -- A plugin that provides refactoring helper functions
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
})
