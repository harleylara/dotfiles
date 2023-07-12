local status, packer = pcall(require, "packer")

    if (not status) then
        print("Packer is not installed")
        return
    end

    -- Only required if you have packer configured as `opt`
    vim.cmd [[packadd packer.nvim]]

    packer.startup(function(use)

    -- Packer can manage itself
    use {
        'wbthomason/packer.nvim',
    }

    -- Color scheme
    use 'Shatur/neovim-ayu'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
    }

    -- Neodev - plugin development
    use {
        'folke/neodev.nvim',
    }

    -- Mason
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

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
      'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- File broser extension
    use { "nvim-telescope/telescope-file-browser.nvim" }

    use 'tpope/vim-fugitive'

    use 'ThePrimeagen/harpoon'

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use({
        'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    })

    use '/mnt/d/git-ws/ros.nvim/'

end)
