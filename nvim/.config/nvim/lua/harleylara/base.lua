local opt = vim.opt
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

vim.cmd("autocmd!")
-- This disable clipboard,
-- for some reason it take long time to start
-- and I not using it
-- https://github.com/neovim/neovim/issues/14280#issuecomment-812854079
vim.cmd("let g:loaded_clipboard_provider=1")
vim.g.netrw_banner = 0

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

-- disable mouse

opt.title = true
opt.cursorline = true
opt.relativenumber = true
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 8
opt.shell = 'bash'
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.inccommand = 'split'
opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search

-- Tab stuff
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.wrap = false -- No Wrap lines
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})

-- Add asterisks in block comments
opt.formatoptions:append { 'r' }

opt.colorcolumn = '80'

-- Indexing for filetype
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', "yml", "json"},
  command = 'setlocal shiftwidth=2 tabstop=2'
})


-- Set up custom filetypes
vim.filetype.add {
    extension = {
        -- tex = "tex", -- Change file `.tex` from `plaintext` to just `tex`
        astro = "astro",
        mdx = "markdown.mdx",
        urdf = "urdf",
        xacro = "urdf"
    },
}

-- term colors
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = 'pum'
opt.pumblend = 5
opt.background = 'dark'

vim.opt.listchars = {eol = '↵'}
vim.opt.list = true
