local keymap = vim.keymap
local status, telescope = pcall(require, "telescope.builtin")

if (not status) then
    print("Telescope is not installed keymap unset")
    return
end

-- leader key
vim.g.mapleader = " "

-- prevents yank on delete "x"
-- keymap.set("n", "x", "_x")

-- select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- move selection
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- easy replace
keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Telescope kemaps

local localModule = {}
localModule.search_dotfiles = function()
    -- TODO: can specific directories be ignored. e.g. .git
	telescope.find_files({
		prompt_title = "My Dotfiles",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

keymap.set('n', '<leader>ff', telescope.find_files, {})
keymap.set('n', '<leader>fd', localModule.search_dotfiles, {})
keymap.set('n', '<leader>fg', telescope.live_grep, {})
keymap.set('n', '<c-f>', telescope.current_buffer_fuzzy_find, {})
keymap.set('n', '<leader>fs', ':Telescope file_browser<CR>')

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
