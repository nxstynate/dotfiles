return {
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true, -- Ensure this is a boolean, not a string
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
