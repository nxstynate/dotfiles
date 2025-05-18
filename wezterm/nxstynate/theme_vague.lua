local M = {}

function M.vague()
  return {
    name = "Vague",
    colors = {
      foreground = "#cdcdcd",
      background = "#141414",
      cursor_bg = "#cdcdcd",
      cursor_fg = "#141414",
      cursor_border = "#cdcdcd",
      selection_fg = "#cdcdcd",
      selection_bg = "#252530",

      ansi = {
        "#252530", -- black
        "#d8647e", -- red
        "#7fa563", -- green
        "#f3be7c", -- yellow
        "#6e94b2", -- blue
        "#bb9dbd", -- purple
        "#aeaed1", -- cyan
        "#cdcdcd", -- white
      },

      brights = {
        "#606079", -- bright black
        "#e08398", -- bright red
        "#99b782", -- bright green
        "#f5cb96", -- bright yellow
        "#8ba9c1", -- bright blue
        "#c9b1ca", -- bright purple
        "#bebeda", -- bright cyan
        "#d7d7d7", -- bright white
      },
    },
  }
end

return M