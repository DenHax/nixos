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
  theme = "bearded-arc", -- dark-horizon, flexoki, monochrome, oxocarbon
  transparency = false,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  statusline = {
    theme = "vscode_colored",
    modules = {
      file = function()
        local path = vim.fn.expand "%:p:~"
        local sep = "/"
        local segments = vim.split(path, sep)
        if #segments == 0 then
          return path
        elseif #segments == 1 then
          return segments[#segments]
        else
          return table.concat({ segments[#segments - 1], segments[#segments] }, sep)
        end
      end,
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "▄▄▌ ▐ ▄▌▄▄▄  ▪  ▄▄▄▄▄▄▄▄▄▄▄▄▄ .▄▄▄  ",
      "██· █▌▐█▀▄ █·██ •██  •██  ▀▄.▀·▀▄ █·",
      "██▪▐█▐▐▌▐▀▀▄ ▐█· ▐█.▪ ▐█.▪▐▀▀▪▄▐▀▀▄ ",
      "▐█▌██▐█▌▐█•█▌▐█▌ ▐█▌· ▐█▌·▐█▄▄▌▐█•█▌",
      " ▀▀▀▀ ▀▪.▀  ▀▀▀▀ ▀▀▀  ▀▀▀  ▀▀▀ .▀  ▀",
    },
  },
}

return M
