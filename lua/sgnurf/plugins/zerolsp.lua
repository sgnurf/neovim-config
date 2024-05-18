return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },

    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                local map = function(key, f, desc)
                    vim.keymap.set('n', key, f, { buffer = ev.buf, desc = desc })
                end

                local tb = require('telescope.builtin');
                map('gD', vim.lsp.buf.declaration, 'Go to declaration')
                map('gd', tb.lsp_definitions, 'Go to definition')
                map('gr', tb.lsp_references, 'Go to references')
                map('gi', tb.lsp_implementations, 'Go to implementation')
                map('K', vim.lsp.buf.hover, 'Show hover')
                map('<leader>ds', tb.lsp_document_symbols, 'Show document symbols')
                map('<leader>ws', tb.lsp_workspace_symbols, 'Show workspace symbols')
                map('<leader>D', tb.lsp_type_definitions, 'Show type definition')
                map('<leader>ca', vim.lsp.buf.code_action, 'Show code actions')
                map('<leader>rn', vim.lsp.buf.rename, 'Rename')
                map('<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end, 'Format')
                vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = 'Show code actions' })
            end,
        })

        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = 'LuaJIT' },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                '${3rd}/luv/library',
                                unpack(vim.api.nvim_get_runtime_file('', true)),
                            },
                        },
                        completion = {
                            callSnippet = 'Replace',
                        },
                    },
                },
            },
            rust_analyzer = {},
            tsserver = {},
        }

        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()

        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
        })

        require("mason-lspconfig").setup({
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    require('lspconfig')[server_name].setup(server)
                end,
            }
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
        vim.filetype.add({ extension = { templ = "templ" } })
    end
}
