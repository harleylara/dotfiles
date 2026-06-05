vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim"
})

local lualine = require("lualine")

lualine.setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '|', right = '|'},
  }
})
