require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "clangd",
        "pyright",

        -- Web stuff
        "html",           -- HTML
        "cssls",          -- CSS
        "intelephense",   -- PHP (alternatives: phpactor)
        "emmet_ls",       -- Emmet (HTML/CSS shortcuts)
    }
})
