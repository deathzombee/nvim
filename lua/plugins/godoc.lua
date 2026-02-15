return {
    {
        "fredrikaverpil/godoc.nvim",
        version = "*",
        cmd = { "GoDoc" },
        build = "env GOTOOLCHAIN=go1.22.7 go install github.com/lotusirous/gostdsym/stdsym@latest",
        opts = {},
        dependencies = {
            { "nvim-telescope/telescope.nvim", optional = true },
            { "folke/snacks.nvim", optional = true },
            { "nvim-mini/mini.pick", optional = true },
            { "ibhagwan/fzf-lua", optional = true },
            {
                "nvim-treesitter/nvim-treesitter",
                opts = { ensure_installed = { "go" } },
            },
        },
    },
}
