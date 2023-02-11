return {
    { 'L3MON4D3/LuaSnip',
        version = "1.*",
        build = "make install_jsregexp",
        dependencies = { 'rafamadriz/friendly-snippets' },
    },
    { 'rafamadriz/friendly-snippets',
        lazy = false,
        config = function()
          require 'luasnip.loaders.from_vscode'.lazy_load {}
        end
    },
}
