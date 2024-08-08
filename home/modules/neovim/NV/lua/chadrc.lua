-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

function LineNumberColors()
  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
end
LineNumberColors()

---@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "kanagawa",
  transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  integrations = {
    "blankline",
    "cmp",
    "git",
    "mason",
    "whichkey",
    "telescope",
  },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "██▄   ▄███▄      ▄    ▄  █ ██       ▄ ",
      "█  █  █▀   ▀      █  █   █ █ █  ▀▄   █",
      "█   █ ██▄▄    ██   █ ██▀▀█ █▄▄█   █ ▀ ",
      "█  █  █▄   ▄▀ █ █  █ █   █ █  █  ▄ █  ",
      "███▀  ▀███▀   █  █ █    █     █ █   ▀▄",
      "              █   ██   ▀     █   ▀    ",
      "                            ▀         ",
    },
  },
}
return M
