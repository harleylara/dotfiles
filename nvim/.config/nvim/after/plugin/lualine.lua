local status, lualine = pcall(require, 'lualine')

if (not status) then return end

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '|', right = '|'},
  },
})
