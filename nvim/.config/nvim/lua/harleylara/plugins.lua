local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")

if (not status) then
    print("Lazy is not installed")
    return
end


lazy.setup({

    -- Color scheme
    'Shatur/neovim-ayu',

    -- Status line
    'nvim-lualine/lualine.nvim',

    -- Neodev - plugin development
    'folke/neodev.nvim',

    -- Plenary
    "nvim-lua/plenary.nvim",

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- LSP
    'neovim/nvim-lspconfig',

    -- nvim-cmp source for neovim's built-in language server client
    'hrsh7th/cmp-nvim-lsp',
    -- nvim-cmp source for buffer words
    'hrsh7th/cmp-buffer',
    -- nvim-cmp source for path
    'hrsh7th/cmp-path',
    -- nvim-cmp source for vim's cmdline
    'hrsh7th/cmp-cmdline',
    -- Autocompletion
    'hrsh7th/nvim-cmp',

    -- Snip engine
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- Treesitter 
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    'nvim-treesitter/nvim-treesitter-context',

    -- Autopair and autotag
    'windwp/nvim-autopairs',
    'windwp/nvim-ts-autotag',

    -- Fuzzy finder
    {
      'nvim-telescope/telescope.nvim', version= '0.1.1',
    -- or                            , branch = '0.1.x',
      depencencies = {'nvim-lua/plenary.nvim'}
    },
    -- File broser extension
    { "nvim-telescope/telescope-file-browser.nvim" },

    'tpope/vim-fugitive',

    'ThePrimeagen/harpoon',

    {
        'projekt0n/github-nvim-theme', version= 'v0.0.7',
    },

    {
        dir = '/mnt/d/git-ws/ros.nvim/',
    },

    'dstein64/vim-startuptime'

})
