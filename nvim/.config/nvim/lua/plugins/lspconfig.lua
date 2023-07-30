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
        local status, nvim_lsp = pcall(require, 'lspconfig')

        if (not status) then return end

        local protocol = require('vim.lsp.protocol')

        -- Use an on_attach function to only map the following keys
        -- after the language server attaches to the current buffer
        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local bufopts = { noremap=true, silent=true, buffer=bufnr }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.net('n', 'gi', vim.lsp.buf.implementation, bufopts)
            -- vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
            -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
            -- vim.keymap.set('n', '<space>wl', function()
            --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            -- end, bufopts)
            -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            -- vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)

        end

        -- Set up lspconfig.
        local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

        nvim_lsp.tsserver.setup{
            on_attach = on_attach,
            capabilities = capabilities
        }

        nvim_lsp.pyright.setup{
            on_attach = on_attach,
            capabilities = capabilities,
        }

        local sumneko_binary = "/home/harley/tooling/sumneko/bin/lua-language-server"
        nvim_lsp.lua_ls.setup {
            on_attach = on_attach,
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
            on_attach = on_attach,
            capabilities = capabilities
        }

        nvim_lsp.gopls.setup{
            on_attach = on_attach,
            capabilities = capabilities
        }

        nvim_lsp.clangd.setup{
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
        }

        --------------------------------------------------[[
        -- Mason
        --------------------------------------------------]]
        local _, mason = pcall(require, 'mason')

        if (not status) then return end

        local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')

        if (not status2) then return end

        mason.setup {
            install_root_dir = os.getenv("HOME") .. "/tooling/mason"
        }

        mason_lspconfig.setup {
            ensure_installed = { "tsserver", "pyright", "html", "cmake-language-server", "astro", "clangd", "css", "tailwindcss", "gopls"},
            automatic_installation = true,
        }

        mason_lspconfig.setup_handlers {
            -- The first entry (without a key) will be the default handler
            -- and will be called for each installed server that doesn't have
            -- a dedicated handler.
            function (server_name) -- default handler (optional)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide a dedicated handler for specific servers.
            -- For example, a handler override for the `rust_analyzer`:
            -- ["rust_analyzer"] = function ()
            --    require("rust-tools").setup {}
            -- end
        }

    end
}
