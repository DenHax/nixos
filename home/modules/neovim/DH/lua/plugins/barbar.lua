return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons",
	},
	enabled = false,
	init = function()
		vim.g.barbar_auto_setup = false
		require("barbar").setup({
			-- animation = true,
			auto_hide = true,
			tabpages = true,
		})
	end,
	opts = {},
	version = "^1.0.0",
}
