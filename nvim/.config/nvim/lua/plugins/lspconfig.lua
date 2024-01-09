return {
    "neovim/nvim-lspconfig",
    -- event = "InsertEnter",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        'folke/neodev.nvim'
    },
    config = function()
        --------------------------------------------------[[
        -- Mason
        --------------------------------------------------]]
        local mason_status, mason = pcall(require, 'mason')

        if (not mason_status) then return end

        local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')

        if (not status2) then return end

        mason.setup {
            install_root_dir = os.getenv("HOME") .. "/tooling/mason"
        }

        mason_lspconfig.setup {
            ensure_installed = {
                "tsserver",
                "pyright",
                "html",
                "cmake",
                "astro",
                "clangd",
                "cssls",
                "tailwindcss",
                "gopls",
                "lua_ls",
                "texlab"
            },
            automatic_installation = true,
        }

        local status, nvim_lsp = pcall(require, 'lspconfig')

        if (not status) then return end

        local protocol = require('vim.lsp.protocol')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        nvim_lsp.tsserver.setup{
            capabilities = lsp_capabilities,
        }

        nvim_lsp.pyright.setup{
            capabilities = lsp_capabilities,
        }

        nvim_lsp.tailwindcss.setup{
            capabilities = lsp_capabilities
        }

        local sumneko_binary = "/home/" .. vim.env.USER .. "/tooling/sumneko/bin/lua-language-server"
        nvim_lsp.lua_ls.setup {
            capabilities = lsp_capabilities,
            cmd = { sumneko_binary },
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                }
            }
        }

        nvim_lsp.astro.setup{
            capabilities = lsp_capabilities
        }

        nvim_lsp.gopls.setup{
            capabilities = lsp_capabilities
        }

        nvim_lsp.clangd.setup{
            cmd = { "clangd", "--header-insertion=never"},
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
        }

        nvim_lsp.cmake.setup{}

        nvim_lsp.texlab.setup{}


    end
}
