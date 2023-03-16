
local status, theme = pcall(require, "github-theme")

if (not status) then
    print("Github color scheme not installed")
    return
end

theme.setup({
  theme_style = "dark_default",
  -- other config
})

-- override the color of the colorcolumn
vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=0, bg="#000000" })
