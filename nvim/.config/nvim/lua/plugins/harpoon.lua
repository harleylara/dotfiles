vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "ha", function() harpoon:list():add() end, { desc = "Harpoon add file",})

vim.keymap.set("n", "hl", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon list", })

for i = 1, 6 do
  vim.keymap.set("n", "<leader>" .. i, function()
    harpoon:list():select(i)
  end, {
    desc = "Harpoon file " .. i,
  })
end
