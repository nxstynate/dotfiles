-- return {
--   {
--     "ellisonleao/gruvbox.nvim",
--     opts = {
--       transparent_mode = true, -- Ensure this is a boolean, not a string
--     },
--     config = function(_, opts)
--       require("gruvbox").setup(opts)
--       vim.cmd("colorscheme gruvbox")
--     end,
--   },
--   {
--     "LazyVim/LazyVim",
--     opts = {
--       colorscheme = "gruvbox",
--     },
--   },
-- }
return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true, -- Enable transparency
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
}
