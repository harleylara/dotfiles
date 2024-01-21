return {
    'nvim-telescope/telescope.nvim',
    event = "InsertEnter",
    version= '0.1.x',
    dependencies = {'nvim-lua/plenary.nvim'},
    opts = {
        -- all mapping on lua/harleylara/keymaps.lua
        defaults = { file_ignore_patterns = { "node_modules" }}
    }
}
