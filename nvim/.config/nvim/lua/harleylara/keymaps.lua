local keymap = vim.keymap

-- leader key
vim.g.mapleader = " "

-- open netrw
keymap.set("n", "<leader>e", vim.cmd.Ex)

-- prevents yank on delete "x"
-- keymap.set("n", "x", "_x")

-- select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- move selection
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-d>", "<C-d>zz")

-- easy replace
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Personal tools
-- cht.sh
keymap.set("n", "<C-h>", ":silent !tmux split-window -h bash -c cht.sh<CR>")

-- lua and plugins
keymap.set("n", "''", ":luafile %<CR>")

keymap.set("n", "K", vim.lsp.buf.hover)

-- Telescope kemaps
keymap.set('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
keymap.set('n', '<leader>fd', ':lua require("telescope.builtin").git_files({prompt_title="My Dotfiles", cwd="~/dotfiles/", hidden=true})<CR>')
keymap.set('n', '<C-f>', ':lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>')
keymap.set('n', '<leader>hh', ':lua require("telescope.builtin").help_tags()<CR>')
keymap.set('n', '<leader>fs', ':lua require("telescope.builtin").file_browser()<CR>')

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
