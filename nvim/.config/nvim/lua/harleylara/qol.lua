local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight-yank", { clear = true }),
  desc = "Briefly highlight yanked text",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 120 })
  end,
})

-- Restore cursor to last position when reopening a file
autocmd("BufReadPost", {
  group = augroup("restore-cursor", { clear = true }),
  desc = "Restore cursor position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)

    if mark[1] >= 1 and mark[1] <= line_count then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Per-filetype indentation (use FileType event + opt_local, and correct filetype names)
autocmd("FileType", {
  group = augroup("indent-2", { clear = true }),
  pattern = {
    "xml",
    "html",
    "xhtml",
    "yaml",
    "json",
    "jsonc",
    "css",
    "javascript",
    "typescript",
    "markdown",
    "markdown.mdx",
    "urdf",
    "astro",
    "lua",
    "cpp",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end,
})

-- Diagnostics
vim.diagnostic.config({
  signs = true,
  underline = true,
  virtual_text = { current_line = true },
})


autocmd("FileType", {
  group = augroup("spell", { clear = true }),
  pattern = {
    "text",
    "markdown",
    "gitcommit",
    "rst",
    "asciidoc",
    "tex",
    "plaintex",
  },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = { "en_us" }
  end,
})
