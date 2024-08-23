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

-- Custom filename view
--
-- NOTE: LuaLine
--local function filename_and_parent(path, sep)
--   local segments = vim.split(path, sep)
--   if #segments == 0 then
--     return path
--   elseif #segments == 1 then
--     return segments[#segments]
--   else
--     return table.concat({ segments[#segments - 1], segments[#segments] }, sep)
--   end
-- end
--
-- NOTE: NvChad
--M.file = function()
--   local icon = "󰈚"
--   local path = vim.api.nvim_buf_get_name(M.stbufnr())
--   local name = (path == "" and "Empty ") or path:match "([^/\\]+)[/\\]*$"
--
--   if name ~= "Empty " then
--     local devicons_present, devicons = pcall(require, "nvim-web-devicons")
--     if devicons_present then
--       local ft_icon = devicons.get_icon(name)
--       icon = (ft_icon ~= nil and ft_icon) or icon
--     end
--   end
--
--   return { icon, name }
-- end
-- data = filename_and_parent(vim.fn.expand('%:p:~'), path_separator)
