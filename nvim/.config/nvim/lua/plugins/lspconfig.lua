vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

local servers = {
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

vim.lsp.config("clangd", {
  cmd = { "clangd", "--header-insertion=never" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
})

vim.lsp.config("texlab", {
  filetypes = { "tex", "plaintex", "bib", "markdown", "markdown.mdx" },
})

vim.lsp.config("lemminx", {
  filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "urdf", "xacro" },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_enable = false,
})

vim.lsp.enable(servers)
