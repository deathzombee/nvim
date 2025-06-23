return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            -- LSP servers
            "lua-language-server",
            "gopls",
            "pyright",
            "clangd",
            "jdtls",
            "phpactor",

            -- Formatters
            "stylua",
            "black",
            "isort",
            "gofumpt",
            "goimports",
            "prettier",
            "shfmt",
            "rustfmt",
            "rubocop",

            -- Linters
            "shellcheck",
            "flake8",
            "eslint_d",
            "hadolint",
            "yamllint",

            -- Debuggers
            "delve",
        },
    },
}
