vim.pack.add({
  "https://github.com/projekt0n/github-nvim-theme",
  "https://github.com/lervag/vimtex",
  "https://github.com/iamcco/markdown-preview.nvim",
  "https://github.com/Kicamon/markdown-table-mode.nvim",
})

vim.cmd.colorscheme "github_dark_high_contrast"

vim.api.nvim_set_hl(0, "LineNr", {bg="#181818"})
vim.api.nvim_set_hl(0, "Normal", {bg="#101010"})
vim.api.nvim_set_hl(0, "CursorLine", {bg="#181818"})


vim.g.vimtex_view_method = "zathura"

--[[
-- mark
--]]
vim.fn["mkdp#util#install"]()


--[[
-- markdown-table-mode
--]]
require('markdown-table-mode').setup()
