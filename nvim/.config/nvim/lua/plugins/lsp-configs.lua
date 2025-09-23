return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local default_opts = { capabilities = capabilities }

            -- lua (có settings riêng)
            local lua_cfg = vim.lsp.config.lua_ls or {}
            vim.lsp.start(vim.tbl_deep_extend("force", lua_cfg, {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        telemetry = { enable = false },
                    },
                },
            }))

            -- các server khác
            local servers = {
                "gopls",
                "ruff",
                -- "svelte",
                "dockerls",
                -- "zls",
                -- "rust_analyzer"
                -- "postgrestools", -- kiểm tra xem lspconfig có không
                -- "docker_compose_language_service", -- kiểm tra xem lspconfig có không
            }

            for _, server in ipairs(servers) do
                local cfg = vim.lsp.config[server]
                if cfg then
                    vim.lsp.start(vim.tbl_deep_extend("force", cfg or {}, default_opts))
                -- else
                --     vim.notify("⚠️ LSP server '" .. server .. "' không tồn tại trong vim.lsp.config", vim.log.levels.WARN)
                end
            end

            -- keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

            -- list all methods in a file
            vim.keymap.set("n", "<leader>fm", function()
                local filetype = vim.bo.filetype
                local symbols_map = {
                    python = "function",
                    javascript = "function",
                    typescript = "function",
                    java = "class",
                    lua = "function",
                    go = { "method", "struct", "interface" },
                }
                local symbols = symbols_map[filetype] or "function"
                require("telescope.builtin").lsp_document_symbols({ symbols = symbols })
            end, {})
        end,
    },
}
