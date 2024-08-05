return {
	"stevearc/conform.nvim",
	lazy = true,
	cmd = "ConformInfo",
	event = "BufRead",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				sh = { "shfmt" },

				lua = { "stylua" },

				nix = { "nixfmt" },

				go = { "gofmt", "goimports" },

				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				yaml = { "prettierd" },
				typescript = { "prettierd" },
				javascript = { "prettierd" },
				typescriptreact = { "prettierd" },
				javascriptreact = { "prettierd" },

				markdown = { "prettierd" },
				-- ["markdown.mdx"] = { "prettierd" },

				sql = { "sqlfluff" },

				-- rust = { "rustfmt" },
				python = { "isort", "black" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			format_after_save = {
				lsp_format = "fallback",
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({})
		end, { desc = "Formatting" })
	end,
}
