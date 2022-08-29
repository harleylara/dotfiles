local status, packer = pcall(require, "packer")

if (not status) then
    print("Packer is not installed")
    return
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    
    -- Color scheme
    use 'Shatur/neovim-ayu'

    -- Status line
    use 'hoob3rt/lualine.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'

end)
