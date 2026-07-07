vim.pack.add({
  "https://github.com/projekt0n/github-nvim-theme",
})

vim.cmd.colorscheme("github_dark_high_contrast")

local highlights = {
  LineNr = { bg = "#181818" },
  Normal = { bg = "#101010" },
  CursorLine = { bg = "#181818" },
}

for group, opts in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, opts)
end
