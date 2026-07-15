-- Neovim editor/ui
return {
    ---- Text Editing ----
    -- Comment lines using `gc` command
    { "numToStr/Comment.nvim", opts = {} },
    -- Expands on `di'` type of commands
    { "wellle/targets.vim" },
    -- Command `cs"'` changes a pair of "" to a pair of ''
    -- This plugin also allows to quickly add parens around words
    -- (in visual mode press 'S)' to wrap with parens)
    { "tpope/vim-surround" },
    -- Automatically add matching parens
    { "jiangmiao/auto-pairs" },
    -- Undo history
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
            position = "left",      -- "right", "bottom"
            ignore_filetype = {
                "undotree",
                "undotreeDiff",
                "qf",
                "TelescopePrompt",
                "spectre_panel",
                "tsplayground"
            },
            window = {
                winblend = 30,
            },
            keymaps = {
                ["j"]    = "move_next",
                ["k"]    = "move_prev",
                ["gj"]   = "move2parent",
                ["J"]    = "move_change_next",
                ["K"]    = "move_change_prev",
                ["<cr>"] = "action_enter",
                ["p"]    = "enter_diffbuf",
                ["q"]    = "quit",
            },
        }
    },
    -- :Bdelete command that deletes a buffer without closing a window
    {
        "moll/vim-bbye",
        config = function()
            vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<CR>')
            vim.keymap.set('n', '<leader>bD', '<cmd>Bdelete!<CR>')
        end,
    },

    ---- Display ----
    -- Tab identation highlighting
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
    -- Git decorations inside neovim
    { "lewis6991/gitsigns.nvim",             opts = {} },
    -- Add colorful icons
    { "nvim-tree/nvim-web-devicons" },

    ---- Neovim UI ----
    -- Status line at the bottom of neovim screen
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                icons_enables = false,
            }
        }
    },
    -- A plugin that shows tabs at the top
    {
        "akinsho/bufferline.nvim",
        opts = {
            options = {
                mode = "buffers",
                offsets = {
                    { filetype = "NvimTree" }
                },
            },
            highlights = {
                buffer_selected = {
                    italic = false
                },
                indicator_selected = {
                    fg = { attribute = "fg", highlight = "Function" },
                    italic = false
                }
            }
        }
    },
    -- Fuzzy file finder
    { "nvim-telescope/telescope.nvim" },
    -- Floating terminal windows
    { "numToStr/FTerm.nvim" },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate"
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable              = false,     -- Enable this plugin (Can be enabled/disabled later via commands)
            max_lines           = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
            min_window_height   = 0,         -- Minimum editor window height to enable context. Values <= 0 mean no limit.
            line_numbers        = true,
            multiline_threshold = 20,        -- Maximum number of lines to show for a single context
            trim_scope          = "inner",   -- Which context lines to discard if `max_lines` is exceeded. Choices: "inner", "outer"
            mode                = "topline", -- Line used to calculate context. Choices: "cursor", "topline"
            -- Separator between context and content. Should be a single character string, like "-".
            -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
            separator           = nil,
            zindex              = 20,  -- The Z-index of the context window
            on_attach           = nil, -- (fun(buf: integer): boolean) return false to disable attaching
        },
    },
    -- Useful plugin to show you pending keybinds.
    {
        "folke/which-key.nvim",
        event = "VimEnter", -- Sets the loading event to "VimEnter"
        opts = {},
    },
    -- File tree like in good ol' IDEs
    { "nvim-tree/nvim-tree.lua" },
    -- {
    --     "m4xshen/hardtime.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    --     opts = { }
    -- },
    -- Git integration inside neovim
    { "tpope/vim-fugitive" },
    {
        "5ohue/soh_notes.nvim",
        -- dir = require("utl").projects_dir .. "Personal/soh_notes.nvim",
        opts = {
            root_dir = "~/Documents/My_Notes/",
            journals_dir = "Journals",
        }
    }
}
