vim.pack.add({
  "https://github.com/lervag/vimtex",
  "https://github.com/iamcco/markdown-preview.nvim",
  "https://github.com/Kicamon/markdown-table-mode.nvim",
})

vim.g.vimtex_view_method = "zathura"

require("markdown-table-mode").setup()

vim.api.nvim_create_user_command("MarkdownPreviewInstall", function()
  vim.fn["mkdp#util#install"]()
end, {
  desc = "Install markdown-preview.nvim app",
})
