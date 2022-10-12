local status, packer = pcall(require, "packer")

if (not status) then
    print("Packer is not installed")
    return
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Color scheme
    use 'Shatur/neovim-ayu'

    -- Status line
    use 'nvim-lualine/lualine.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'

    -- nvim-cmp source for neovim's built-in language server client
    use 'hrsh7th/cmp-nvim-lsp'
    -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-buffer'
    -- nvim-cmp source for path
    use 'hrsh7th/cmp-path'
    -- nvim-cmp source for vim's cmdline
    use 'hrsh7th/cmp-cmdline'
    -- Autocompletion
    use 'hrsh7th/nvim-cmp'

    -- Snip engine
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Treesitter 
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Autopair and autotag
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'

    -- Fuzzy finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- File broser extension
    use { "nvim-telescope/telescope-file-browser.nvim" }
   
    -- Magit for neovim
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }

    use 'ThePrimeagen/harpoon'

end)
