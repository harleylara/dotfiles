local keymap = vim.keymap

-- open netrw
keymap.set("n", "<leader>e", vim.cmd.Ex)

-- prevents yank on delete "x"
-- keymap.set("n", "x", "_x")

-- move selection
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- easy replace
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- ros
keymap.set("n", "<leader>ri", ":silent lua require('ros').interface_show()<CR>")
keymap.set("n", "<leader>rt", ":silent lua require('ros').topic_info()<CR>")

-- lua and plugins
keymap.set("n", "''", ":luafile %<CR>")

-- cool thing for lsp
-- Harley: check for this in the lsp config
-- keymap.set("n", "K", vim.lsp.buf.hover)

-- Neogit keymaps
keymap.set('n', '<leader>g', ':Git<CR>')
