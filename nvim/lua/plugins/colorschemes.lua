return {
    {"5ohue/atlasue.vim"}, -- My own color scheme!!!
    {
        "5ohue/nova_cs_theme_example",
        -- dir = "~/Projects/Personal/nova_cs_theme_example"
    },
    {"rebelot/kanagawa.nvim"},
    {"xero/miasma.nvim"},
    {
        "ribru17/bamboo.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("bamboo").setup{}
            require("bamboo").load()
        end,
    },
    {"bdesham/biogoo"},
    {"noahfrederick/vim-noctu"},
    {"morhetz/gruvbox"},
    {"sainnhe/gruvbox-material"},
}
