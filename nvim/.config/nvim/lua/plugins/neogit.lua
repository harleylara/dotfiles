vim.pack.add({
  "https://github.com/neogitorg/neogit"
})
local neogit = require('neogit')
vim.keymap.set('n', '<leader>g', neogit.open)
