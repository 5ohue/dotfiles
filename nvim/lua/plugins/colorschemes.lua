return {
    -- My colorschemes
    {
        "5ohue/nova_cs.nvim",
        build = function(plugin)
            require("nova_cs").build(plugin.opts or {})
        end,
        -- If it runs before "bufferline", it will be screwed
        priority = 1000,
        opts = {
            colorscheme = "soup_nova",
        },
    },
    { "5ohue/soup_nova.nvim" },
    { "5ohue/atlasue.vim" },

    -- Other colorschemes
    { "rebelot/kanagawa.nvim" },
    { "xero/miasma.nvim" },
    { "ribru17/bamboo.nvim" },
    { "bdesham/biogoo" },
    { "noahfrederick/vim-noctu" },
    { "morhetz/gruvbox" },
    { "sainnhe/gruvbox-material" },
}
