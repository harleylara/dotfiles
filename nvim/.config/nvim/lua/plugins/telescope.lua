local zotero_path = vim.fn.expand("~/git-ws/telescope-zotero.nvim")
local plugins = {
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
}

if vim.uv.fs_stat(zotero_path) then
  table.insert(plugins, zotero_path)
end

vim.pack.add(plugins)

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
    },
  },
})

vim.keymap.set("n", "fh", builtin.help_tags, {
  desc = "Find help",
})

local function locate_bib()
  local file = vim.api.nvim_buf_get_name(0)
  local dir = vim.fn.fnamemodify(file, ":h")

  for _, candidate in ipairs({
    dir .. "/references.bib",
    vim.fn.fnamemodify(dir, ":h") .. "/references.bib",
  }) do
    if vim.fn.filereadable(candidate) == 1 then
      return candidate
    end
  end
end

local ok, zotero = pcall(require, "zotero")
if not ok then
  return
end

zotero.setup({
  zotero_db_path = "/mnt/c/Users/Harley Lara/Zotero/zotero.sqlite",
  better_bibtex_db_path = "/mnt/c/Users/Harley Lara/Zotero/better-bibtex.sqlite",
  ft = {
    tex = {
      insert_key_formatter = function(citekey)
        return "\\cite{" .. citekey .. "}"
      end,
      locate_bib = locate_bib,
    },
    plaintex = {
      insert_key_formatter = function(citekey)
        return "\\cite{" .. citekey .. "}"
      end,
      locate_bib = locate_bib,
    },
    default = {
      insert_key_formatter = function(citekey)
        return "@" .. citekey
      end,
      locate_bib = locate_bib,
    },
  },
})

vim.keymap.set("n", "fz", function()
  telescope.extensions.zotero.zotero()
end, {
  desc = "Find Zotero citation",
})
