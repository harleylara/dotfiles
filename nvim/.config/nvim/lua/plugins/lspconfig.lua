vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim"
})

local mason = require("mason")
mason.setup()

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  vim.notify("mason-lspconfig is not installed", vim.log.levels.WARN)
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "pyright",
    "ts_ls",
    "tailwindcss",
    "astro",
    "gopls",
    "clangd",
    "cmake",
    "texlab",
    "lemminx",
    "lua_ls",
  }
})

vim.lsp.enable("pyright")

vim.lsp.enable("ts_ls")

vim.lsp.enable("tailwindcss")

vim.lsp.enable("astro")

vim.lsp.enable("gopls")

vim.lsp.config("clangd", {
  cmd = { "clangd", "--header-insertion=never"},
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
})
vim.lsp.enable("clangd")

vim.lsp.enable("cmake")

vim.lsp.config("textlab", {
  filetypes = { "tex", "plaintex", "bib", "markdown", "markdown.mdx" }
})
vim.lsp.enable("textlab")

vim.lsp.config("lemminx", {
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "urdf", "xacro" }
})
vim.lsp.enable("lemminx")

vim.lsp.config("lua_ls", {
  cmd = { "/home/" .. vim.env.USER .. "/tooling/sumneko/bin/lua-language-server" },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { "vim" } },
    },
  }
})
vim.lsp.enable("lua_ls")
