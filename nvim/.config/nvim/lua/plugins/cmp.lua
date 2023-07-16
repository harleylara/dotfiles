return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'L3MON4D3/LuaSnip',
        -- Snip engine
        'saadparwaiz1/cmp_luasnip',

        -- nvim-cmp source for neovim's built-in language server client
        'hrsh7th/cmp-nvim-lsp',
        -- nvim-cmp source for buffer words
        'hrsh7th/cmp-buffer',
        -- nvim-cmp source for path
        'hrsh7th/cmp-path',
        -- nvim-cmp source for vim's cmdline
        'hrsh7th/cmp-cmdline',
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            snippet = {
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),

            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'buffer' },
              { name = 'path' },
              -- { name = 'cmdline' },
            })
        })
    end
}
