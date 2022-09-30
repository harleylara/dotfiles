local status, telescope = pcall(require, 'telescope')

if (not status) then return end

telescope.setup {
    -- all mapping on lua/harleylara/keymaps.lua
}

require("telescope").load_extension "file_browser"
