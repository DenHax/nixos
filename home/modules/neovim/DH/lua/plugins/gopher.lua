return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	build = function()
		vim.cmd.GoInstallDeps()
	end,
	---@type gopher.Config
	opts = {},
	config = function()
		require("gopher").setup({})
	end,
}
