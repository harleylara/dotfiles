-- Appearance / UI
require("plugins.theme")
require("plugins.lualine")

-- Writing / markup
require("plugins.markup")

-- Editing
require("plugins.treesitter")

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("plugins.autopairs")
    require("plugins.cmp")
  end,
})

-- Language tooling
require("plugins.lspconfig")

-- Navigation
require("plugins.fff")
require("plugins.telescope")
require("plugins.harpoon")

-- Git
require("plugins.neogit")

-- local test plugin
-- require("plugins.ros")
