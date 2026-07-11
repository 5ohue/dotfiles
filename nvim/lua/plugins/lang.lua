-- Language support
return {
    ---- LSP Support ----
    {"neovim/nvim-lspconfig"},
    {"williamboman/mason.nvim"},
    {"williamboman/mason-lspconfig.nvim"},

    ---- Autocompletion ----
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/nvim-cmp"},

    ---- LSP UI ----
    -- LSP status UI (bottom right stuff)
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        opts = { },
    },
    -- Highlight all the symbols that are under the cursor
    {"RRethy/vim-illuminate"},
    -- A pretty list for showing diagnostics, references, telescope results and location lists to help you solve all the trouble your code is causing.
    {
        "folke/trouble.nvim",
        opts = { },
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
        },
    },
    -- Render markdown inside of neovim
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        ---@module "render-markdown"
        ---@type render.md.UserConfig
        opts = { },
    },
    -- Preview markdown in browser
    {
        "selimacerbas/markdown-preview.nvim",
        dependencies = { "selimacerbas/live-server.nvim" },
        opts = {
            -- all optional; sane defaults shown
            instance_mode = "takeover",  -- "takeover" (one tab) or "multi" (tab per instance)
            port = 0,                    -- 0 = auto (8421 for takeover, OS-assigned for multi)
            open_browser = true,
            default_theme = "dark",      -- "dark" or "light"; initial preview theme
            debounce_ms = 300,
        },
    },
}
