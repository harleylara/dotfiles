vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
  debug = { enabled = true, show_scores = true },
}

local fff = require("fff")

vim.keymap.set('n', '<leader>ff', fff.find_files, { desc = 'FFFind files' })
vim.keymap.set('n', '<C-f>', fff.live_grep, { desc = 'FFFind files' })

vim.keymap.set('n', '<leader>fd', function () fff.find_files_in_dir("~/dotfiles") end, { desc = '[f]ind files intro my dotfiles directory'})
