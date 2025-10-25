-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core UI
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.termguicolors = true
opt.showmode = false
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.colorcolumn = { 80 }
opt.wrap = false
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.mouse = "a"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Indentation (defaults; some filetypes are overridden below)
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.breakindent = true
opt.breakindentopt = "shift:2"
opt.showbreak = "↳ "

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "↵" }

opt.undofile = true
opt.updatetime = 200
opt.timeoutlen = 400
opt.inccommand = "split"      -- live :%s preview

-- Netrw
vim.g.netrw_banner = 0

vim.g.loaded_clipboard_provider = 1

-- Clear search with <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    -- tex = "tex", -- Change file `.tex` from `plaintext` to just `tex`
    astro = "astro",
    mdx = "markdown.mdx",
    urdf = "xml",
    xacro = "xml",
    sdf = "xml"
  },
}
