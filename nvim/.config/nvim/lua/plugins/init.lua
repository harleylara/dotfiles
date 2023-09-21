--[[
Hey Harley from the future, here is Harley from the past, JUST a reminder:
    This file should only list plugins that do not require configuration,
    or just a minimal configuration
--]]

return {
    -- Color scheme
    {
        'projekt0n/github-nvim-theme',
        version= 'v0.0.7',
        config = function()
            vim.cmd([[colorscheme github_dark_default]])
            -- I like the column to be dark
            vim.cmd([[highlight ColorColumn ctermbg=black guibg=black]])
            vim.cmd([[highlight NonText ctermfg=gray guifg=#545454]])
        end
    },

    'tpope/vim-fugitive',

    'iamcco/markdown-preview.nvim',

    {
        'ThePrimeagen/harpoon',
        event = "InsertEnter"
    },

    'harleylara/ros.nvim',

    {
        'dstein64/vim-startuptime',
        -- lazy-load on a command
        cmd = "StartupTime",
    }
}
