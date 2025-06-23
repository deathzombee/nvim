return {
    -- Python virtual environment selector
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-telescope/telescope.nvim",
        },
        opts = {
            search_venv_managers = true,
            search = {
                pipenv = false,
                poetry = false,
                venv = {
                    dirs = {
                        "~/.pyenv/versions",
                    },
                },
            },
        },
        event = "VeryLazy",
        keys = {
            { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment" },
            { "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "Select Cached Virtual Environment" },
        },
    },

    -- Python LSP configuration
    {
        "neovim/nvim-lspconfig",
        opts = {
            servers = {
                pyright = {
                    settings = {
                        python = {
                            analysis = {
                                typeCheckingMode = "basic",
                                autoSearchPaths = true,
                                useLibraryCodeForTypes = true,
                                diagnosticMode = "workspace",
                            },
                        },
                    },
                },
            },
        },
    },

    -- Python formatting
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "black", "isort" },
            },
        },
    },
}
