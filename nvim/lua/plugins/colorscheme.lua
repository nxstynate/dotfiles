return {
  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    lazy = false,
    opts = {
      transparent_mode = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("gruvbox").setup(opts)
    end,
  },

  -- Solarized Osaka
  {
    "craftzdog/solarized-osaka.nvim",
    name = "solarized-osaka",
    priority = 1000,
    lazy = false,
    opts = {
      transparent = true,
      terminal_colors = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
    end,
  },

  -- Rose Pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    opts = {
      enable = {
        terminal = true,
      },
      styles = {
        transparency = true,
        bold = true,
        italic = true,
      },
    },
    config = function(_, opts)
      require("rose-pine").setup(opts)
    end,
  },

  -- Set your default colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
