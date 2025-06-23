return {
  -- Telescope keymaps
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
        end,
        desc = "Find Plugin File",
      },
      -- add a keymap to browse recent files
      {
        "<leader>fr",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Find Recent Files",
      },
      -- add a keymap to browse git files
      {
        "<leader>fg",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Find Git Files",
      },
    },
  },

  -- LSP keymaps
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Add custom LSP keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local bufnr = args.buf

          if client.server_capabilities.documentSymbolProvider then
            vim.keymap.set("n", "<leader>o", "<cmd>SymbolsOutline<cr>", { buffer = bufnr, desc = "Symbols Outline" })
          end

          if client.server_capabilities.codeActionProvider then
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })
          end

          if client.server_capabilities.renameProvider then
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
          end

          if client.server_capabilities.hoverProvider then
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
          end
        end,
      })
    end,
  },

  -- Buffer navigation
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>bb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Switch Buffer",
      },
    },
  },

  -- Quick save
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>w",
        "<cmd>w<cr>",
        desc = "Save File",
      },
    },
  },

  -- Quick quit
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>q",
        "<cmd>q<cr>",
        desc = "Quit",
      },
    },
  },
} 