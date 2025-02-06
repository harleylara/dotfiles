--[[
Hey Harley from the future, here is Harley from the past, JUST a reminder:
    This file should only list plugins that do not require configuration,
    or just a minimal configuration
--]]
return {
    -- Color scheme
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         vim.cmd.colorscheme "github_dark_high_contrast"
    --     end,
    -- },
    --
    {
        'jesseleite/nvim-noirbuddy',
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = false,
        priority = 1000,
        opts = {
            -- All of your `setup(opts)` will go here
        },
        config = function ()
            require('noirbuddy').setup {
                colors = {
                    primary = '#79C0FF',
                    background = "#000000"
                },
            }
        end
    },

    -- vimtex
    {
      "lervag/vimtex",
      lazy = false,     -- we don't want to lazy load VimTeX
      -- tag = "v2.15", -- uncomment to pin to a specific release
      init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_view_method = "zathura"
      end
    },

    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- markdown tables
    {
        'Kicamon/markdown-table-mode.nvim',
        config = function()
            require('markdown-table-mode').setup({
                filetype = {
                    '*.md', '*.mdx'
                },
                options = {
                    insert = true, -- when typing "|"
                    insert_leave = true, -- when leaving insert
                    pad_separator_line = false, -- add space in separator line
                    alig_style = 'default', -- default, left, center, right
                }}
            )
        end
    }
}
