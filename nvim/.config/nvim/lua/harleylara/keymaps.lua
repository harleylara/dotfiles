--[[
-- Note to Harley in the future: We (you and me, we are the same person)
-- We have decided that this file will be used exclusively 
-- for keymaps related to neovim itself. 
-- 
-- For plugin-specific keymaps, we agree that
-- they should be in the configuration of that plugin.
--]]

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

-- lua and plugins
keymap.set("n", "''", ":luafile %<CR>")

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
