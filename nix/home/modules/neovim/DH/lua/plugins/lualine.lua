return {
	"nvim-lualine/lualine.nvim",
	enable = true,
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabld = true,
				-- 15color, ayu_dark, ayu_mirage, gruvebox_light, gruvebox_material, jellybeans, onedark, powerline, seoul256, solarized_dark, solarized_light, wombat
				theme = "powerline",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 4 } },
				lualine_x = {
					-- { "encoding", "filetype" },
					{ "filetype" },
					{ "encoding" },
					{
						require("noice").api.status.mode.get,
						cond = require("noice").api.status.mode.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
