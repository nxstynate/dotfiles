return {
  --mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  --mason-lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          -- "tsserver",
          -- "rust_analyzer",
          -- "tailwindcss",
          "html",
          -- "ruff_lsp",
          "pyright",
        },
      })
    end,
  },
  -- lsp config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      -- lspconfig.tsserver.setup({})
      -- lspconfig.rust_analyzer.setup({})
      -- lspconfig.tailwindcss.setup({})
      lspconfig.html.setup({})
      -- lspconfig.ruff_lsp.setup({})
      lspconfig.pyright.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
