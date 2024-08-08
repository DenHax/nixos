return {
	"iamcco/markdown-preview.nvim",
	enabled = false,
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	-- build = function()
	-- 	vim.fn["mkdp#util#install"]()
	-- end,
	keys = {
		{
			"<leader>cp",
			ft = "markdown",
			"<cmd>MarkdownPreviewToggle<cr>",
			desc = "Markdown Preview",
		},
	},
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
