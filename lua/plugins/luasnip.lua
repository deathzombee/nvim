-- ~/.config/nvim/lua/plugins/luasnip.lua
return {
    {
        "L3MON4D3/LuaSnip",
        config = function()
            local ls = require("luasnip")
            local s = ls.snippet
            local t = ls.text_node
            local i = ls.insert_node

            ls.add_snippets("all", {
                s({ trig = "#!", name = "Shebang" }, {
                    t("#!/usr/bin/env "),
                    i(1, "bash"),
                    t({ "", "" }),
                    i(0),
                }),
                s({ trig = "rtbash", name = "Red-Team Header" }, {
                    t({ "#!/usr/bin/env bash", "IFS=$'\\n\\t'", "", "TARGET=" }),
                    i(1, "127.0.0.1"),
                    t({ "", "PORT=" }),
                    i(2, "4444"),
                    t({ "", "", "fail() {", '    printf "[!] %s\\n" "$1" >&2', "    exit 1", "}", "", "" }),
                    i(0),
                }),
            })
        end,
    },
    {
        "saghen/blink.cmp",
        opts = {
            keymap = {
                preset = "default",
                ["<Tab>"] = { "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "snippet_backward", "fallback" },
            },
            snippets = {
                preset = "luasnip",
            },
        },
    },
}
