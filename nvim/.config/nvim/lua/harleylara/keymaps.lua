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

-- Harpoon keymaps
keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
keymap.set('n', '<leader>hl', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
keymap.set('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>')
keymap.set('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>')
keymap.set('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>')
keymap.set('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>')
keymap.set('n', '<leader>5', ':lua require("harpoon.ui").nav_file(5)<CR>')
keymap.set('n', '<leader>6', ':lua require("harpoon.ui").nav_file(6)<CR>')

-- new tab
-- keymap.set('n', 'te', ':tabedit')

-- split window
-- keymap.set('n', 'ss', ':split<Return><C-w>w')
-- keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- move window
-- keymap.set('n', '<Space>', '<C-w>w')
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')

-- resize window
-- keymap.set('n', '<C-w><left>', '<C-w><')
-- keymap.set('n', '<C-w><right>', '<C-w>>')
-- keymap.set('n', '<C-w><up>', '<C-w>+')
-- keymap.set('n', '<C-w><down>', '<C-w>-')
