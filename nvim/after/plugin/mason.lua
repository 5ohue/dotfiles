require("mason").setup()
require("mason-null-ls").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "rust_analyzer",
        "clangd",
        "pyright"
    }
})
