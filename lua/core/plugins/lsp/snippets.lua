return {
    'L3MON4D3/LuaSnip',
    { 'rafamadriz/friendly-snippets',
        lazy = false,
        config = function()
          require 'luasnip.loaders.from_vscode'.lazy_load {}
        end
    },
}
