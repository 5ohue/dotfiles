local lspconfig    = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lsp_defaults.capabilities,
    cmp_nvim_lsp.default_capabilities()
)

local lsp_servers = { 'clangd', 'pyright', 'zls' }
for _, lsp in pairs(lsp_servers) do
    lspconfig[lsp].setup { }
end

local capabilities = cmp_nvim_lsp.default_capabilities()
lspconfig['rust_analyzer'].setup {
    capabilities = capabilities
}
