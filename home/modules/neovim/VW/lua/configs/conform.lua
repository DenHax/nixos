local options = {
  formatters_by_ft = {
				sh = { "shfmt" },

				lua = { "stylua" },

				nix = { "nixfmt" },

				go = { "gofmt", "goimports" },

				html = { "prettier" },
				css = { "prettier" },
				json = { "prettier" },
				jsonc = { "prettier" },
				yaml = { "prettier" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				typescriptreact = { "prettier" },
				javascriptreact = { "prettier" },

				markdown = { "prettier" },
				-- ["markdown.mdx"] = { "prettier" },

				sql = { "sqlfluff" },

				-- rust = { "rustfmt" },
				python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  {
	"NvChad/nvim-colorizer.lua",
	-- opts = {},
	config = function()
		require("colorizer").setup({})
	end,
  },
  {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
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
  },
}

return options
