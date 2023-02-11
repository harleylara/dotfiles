local status, telescope = pcall(require, 'telescope')

if (not status) then return end

telescope.setup {
    -- all mapping on lua/harleylara/keymaps.lua
    defaults = { file_ignore_patterns = { "node_modules" }}
}

require("telescope").load_extension "file_browser"
