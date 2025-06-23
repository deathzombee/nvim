return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            -- Core languages
            "lua",
            "vim",
            "vimdoc",

            -- Web development
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "json",
            "jsonc",
            "yaml",

            -- Programming languages
            "python",
            "go",
            "java",
            "c",
            "cpp",
            "c_sharp",
            "rust",
            "php",
            "ruby",
            "scala",
            "kotlin",

            -- Scripting
            "bash",
            "fish",

            -- Markup and config
            "markdown",
            "markdown_inline",
            "toml",
            "ini",
            "dockerfile",

            -- Query and regex
            "query",
            "regex",
        },
        highlight = { enable = true },
        indent = { enable = false },
        -- 🔽 this part adds textobject support
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ap"] = "@parameter.outer",
                    ["ip"] = "@parameter.inner",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
        },
    },
}
