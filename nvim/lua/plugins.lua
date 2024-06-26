require('lazy').setup({
    -- Add colorful icons
    {'nvim-tree/nvim-web-devicons'},
    -- Adds different useful lua functions (used by some plugins)
    {'nvim-lua/plenary.nvim'},
    -- Status line at the bottom of neovim screen
    {
        'nvim-lualine/lualine.nvim',
        opts = {
            options = {
                icons_enables = false,
            }
        }
    },
    -- A plugin that shows tabs at the top
    {
        'akinsho/bufferline.nvim',
        opts = {
            options = {
                mode = 'buffers',
                offsets = {
                    { filetype = 'NvimTree' }
                },
            },
            highlights = {
                buffer_selected = {
                    italic = false
                },
                indicator_selected = {
                    fg = { attribute = 'fg', highlight = 'Function' },
                    italic = false
                }
            }
        }
    },
    -- Tab identation helper
    {'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {}},
    -- Comment lines using `gc` command
    {'numToStr/Comment.nvim', opts = {}},
    -- Fuzzy file finder
    {'nvim-telescope/telescope.nvim'},
    -- Expands on `di'` type of commands
    {'wellle/targets.vim'},
    -- Command `cs"'` changes a pair of "" to a pair of ''
    -- This plugin also allows to quickly add parens around words
    -- (in visual mode press 'S)' to wrap with parens)
    {'tpope/vim-surround'},
    -- Git integration inside neovim
    {'tpope/vim-fugitive'},
    -- Git decorations inside neovim
    {'lewis6991/gitsigns.nvim', opts = {}},
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
        },
        opts = {
            float_diff = true,
            layout = "left_bottom", -- "left_bottom", "left_left_bottom"
            position = "left", -- "right", "bottom"
            ignore_filetype = {
                'undotree',
                'undotreeDiff',
                'qf',
                'TelescopePrompt',
                'spectre_panel',
                'tsplayground'
            },
            window = {
                winblend = 30,
            },
            keymaps = {
                ['j']    = "move_next",
                ['k']    = "move_prev",
                ['gj']   = "move2parent",
                ['J']    = "move_change_next",
                ['K']    = "move_change_prev",
                ['<cr>'] = "action_enter",
                ['p']    = "enter_diffbuf",
                ['q']    = "quit",
            },
        }
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
    -- Color nested brackets differently
    {'HiPhish/rainbow-delimiters.nvim'},
    -- Convinient file navigation
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    -- Create pretty images of code from neovim
    {
        "mistricky/codesnap.nvim",
        build = "make",
        opts = {
            has_breadcrumbs = true,     -- Add file path
            bg_theme = "bamboo"
        }
    },
    {'nvim-treesitter/nvim-treesitter'},
    {
        'nvim-treesitter/nvim-treesitter-context',
        opts = {
            enable              = false,        -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines           = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height   = 0,            -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers        = true,
            multiline_threshold = 20,           -- Maximum number of lines to show for a single context
            trim_scope          = 'inner',      -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
            mode                = 'topline',    -- Line used to calculate context. Choices: 'cursor', 'topline'
            -- Separator between context and content. Should be a single character string, like '-'.
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator           = nil,
            zindex              = 20,           -- The Z-index of the context window
            on_attach           = nil,          -- (fun(buf: integer): boolean) return false to disable attaching
        },
    },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = {}
    -- },

    -- Color themes
    {'5ohue/atlasue.vim'}, -- My own color scheme!!!
    {
        '5ohue/nova_cs_theme_example',
        dir = '/home/sohue/.git-clones/nova_cs_theme_example'
    },
    {'rebelot/kanagawa.nvim'},
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
    -- Highlight all the symbols that are under the cursor
    {'RRethy/vim-illuminate'},
    -- A pretty list for showing diagnostics, references, telescope results and location lists to help you solve all the trouble your code is causing.
    {'folke/trouble.nvim'},
    -- :Neogen command to create documentation quickly
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true,
        -- Uncomment next line if you want to follow only stable versions
        -- version = "*"
    },
})
