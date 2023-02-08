return {
    { 'hrsh7th/nvim-cmp',
        config = function()
          require "core.config.lsp.completion"
        end
    }, -- Required
    'hrsh7th/cmp-nvim-lsp', -- Required
    'hrsh7th/cmp-buffer', -- Optional
    'hrsh7th/cmp-path', -- Optional
    'saadparwaiz1/cmp_luasnip', -- Optional
    'hrsh7th/cmp-nvim-lua', -- Optional
}
