return {
    {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-jdtls","mfussenegger/nvim-jdtls",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "folke/neodev.nvim",
        },
        config = function()
            -- Setup neodev before lspconfig
            require("neodev").setup()

            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua LSP
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true) },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Python LSP
            lspconfig.pyright.setup({ capabilities = capabilities })

            -- C/C++ LSP
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {"clangd", "--background-index"},
                init_options = {
                    "/usr/bin/../lib/gcc/x86_64-linux-gnu/12/../../../../include/c++",
                    "/usr/lib/llvm-14/lib/clang/14.0.0/include",
                    "/usr/local/include",
                    "/usr/include/x86_64-linux-gnu",
                    "/usr/include",
                },
            })

            -- Diagnostic keymaps
            vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })

            -- LSP keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover)
                    vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
                    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
                    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
                    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
                    vim.keymap.set("n", "<space>wl", function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end)
                    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition)
                    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
                    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action)
                    vim.keymap.set("n", "gr", vim.lsp.buf.references)
                    vim.keymap.set("n", "<space>f", function()
                        vim.lsp.buf.format { async = true }
                    end)
                end,
            })

            -- Show diagnostics in a floating window
            vim.diagnostic.config({
                virtual_text = true,
                float = { border = "rounded" },
            })
        end,
    },
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup()
        end,
    },
}
