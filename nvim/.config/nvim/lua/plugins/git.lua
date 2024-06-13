-- return {
--     'tpope/vim-fugitive',
--     config = function()
--         vim.keymap.set('n', '<leader>g', ':Git<CR>')
--     end
-- }
return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true
}
