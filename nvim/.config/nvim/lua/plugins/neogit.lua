vim.pack.add({ "https://github.com/neogitorg/neogit" }, { load = false })

vim.keymap.set("n", "<leader>g", function()
  require("neogit").open()
end, { desc = "Open Neogit" })
