-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Briefly highlight yanked text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 120 }) end,
})

-- Restore cursor to last position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("restore-cursor", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] >= 1 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
  end,
})

-- Per-filetype indentation (use FileType event + opt_local, and correct filetype names)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("setIndent", { clear = true }),
  pattern = {
    "xml","html","xhtml","yaml","json","jsonc","css","javascript","typescript",
    "markdown","markdown.mdx","urdf","astro","lua","cpp",
  },
  callback = function()
    vim.opt_local.shiftwidth  = 2
    vim.opt_local.tabstop     = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = { current_line = true }
})
