require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",  -- Rust
        "clangd",         -- C/C++
        "pyright",        -- Python
        "zls",            -- Zig
        "gopls",          -- Golang
        "marksman",       -- Markdown

        -- Web stuff
        "html",           -- HTML
        "cssls",          -- CSS
        "intelephense",   -- PHP (alternatives: phpactor)
        "emmet_ls",       -- Emmet (HTML/CSS shortcuts)
        "ts_ls",
    }
})
