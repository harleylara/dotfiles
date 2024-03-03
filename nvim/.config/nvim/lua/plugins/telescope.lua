return {
    'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    version= '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
        -- all mapping on lua/harleylara/keymaps.lua
        defaults = { file_ignore_patterns = { "node_modules" }}
    },
    config = function()
        require('telescope').setup()

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[f]ind [f]ile in the current directory and children'})

        vim.keymap.set('n', '<C-f>', builtin.current_buffer_fuzzy_find, { desc = 'Search into the current buffer'})

        vim.keymap.set('n', '<leader>hh', builtin.help_tags, { desc = '[h]elp [h]elp'})

        local find_dotfiles = function()
            return builtin.git_files({
                prompt_title = "My Dotfiles",
                cwd = "~/dotfiles/",
                hidden = true
            })
        end

        vim.keymap.set('n', '<leader>fd', find_dotfiles, { desc = '[f]ind files intro my dotfiles directory'})
    end
}
