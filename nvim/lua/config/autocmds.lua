-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- Configure the notify plugin (if you want transparent notifications, this might not be needed)
require("notify").setup({
  background_colour = "#252525",
})

-- Set backgrounds to be transparent:
local highlight_groups = {
  "Normal",
  "NonText",
  "LineNr",
  "SignColumn",
  "EndOfBuffer",
  "NormalFloat",
  "NotifyBackground",
  "Pmenu",
  "PmenuPreview",
  "LVCmdlineBorder",
}

-- for _, group in ipairs(highlight_groups) do
--   vim.api.nvim_set_hl(0, group, { bg = "none" })
-- end
--
-- -- Specific highlight settings
-- vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#002b36" })
--
-- -- Enable 24-bit RGB color support in the terminal
-- vim.opt.termguicolors = true
