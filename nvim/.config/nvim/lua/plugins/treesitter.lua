vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
})

local parsers = {
  "astro",
  "bash",
  "c",
  "cmake",
  "cpp",
  "css",
  "html",
  "javascript",
  "json",
  -- "latex", -- I'm using VimTeX to manage it
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "tsx",
  "typescript",
  "xml",
}

require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("treesitter", { clear = true }),
  callback = function(ev)
    local ft = vim.bo[ev.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft)

    if pcall(vim.treesitter.start, ev.buf, lang) then
      vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
