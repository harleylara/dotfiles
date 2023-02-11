local status, mason = pcall(require, 'mason')

if (not status) then return end

local status2, mason_lspconfig = pcall(require, 'mason-lspconfig')

if (not status2) then return end

mason.setup {
    install_root_dir = os.getenv("HOME") .. "/tooling/mason"
}

mason_lspconfig.setup {
    ensure_installed = { "html" },
    -- tailwindcss-language-server
    -- css-lsp
    -- html-lsp
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
