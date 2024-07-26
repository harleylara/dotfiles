return {
    'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    version= '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'jmbuhr/telescope-zotero.nvim',
            dependencies = {
                { 'kkharji/sqlite.lua' },
            },
            config = function()
                require("zotero").setup({
                    zotero_db_path = '/mnt/c/Users/Harley Lara/Zotero/zotero.sqlite',
                    better_bibtex_db_path = '/mnt/c/Users/Harley Lara/Zotero/better-bibtex.sqlite',
                })
            end
        }
    },
    config = function()
        local telescope = require("telescope")

        telescope.setup{ 
            defaults = { 
                file_ignore_patterns = { 
                    "node_modules",
                    ".git"
                }
            }
        }

        telescope.load_extension("zotero")

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]ile in the current directory and children'})

        vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, { desc = 'Search into the current buffer'})

        vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = '[h]elp [h]elp'})

        vim.keymap.set('n', '<leader>fz', telescope.extensions.zotero.zotero)

        local find_dotfiles = function()
            return builtin.find_files({
                prompt_title = "My Dotfiles",
                cwd = "~/dotfiles/",
                hidden = true
            })
        end

        vim.keymap.set('n', '<leader>fd', find_dotfiles, { desc = '[f]ind files intro my dotfiles directory'})

    end
}
