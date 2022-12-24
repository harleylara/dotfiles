local opt = vim.opt
local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

vim.wo.number = true

-- disable mouse

opt.title = true
opt.autoindent = true
opt.smartindent = true
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
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 4
opt.tabstop = 4
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

vim.wo.colorcolumn = '80'

-- Indexing for filetype
augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', "yml", "json"},
  command = 'setlocal shiftwidth=2 tabstop=2'
})

-- term colors
opt.termguicolors = true
