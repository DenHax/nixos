local capabilities = require("plugins.lsp-settings.lsp-setup").capabilites
-- local on_attach = require("plugins.lsp-settings.lsp-setup").on_attach

local rust_attach = function(_, bufnr)
	vim.keymap.set("n", "<leader>cR", function()
		vim.cmd.RustLsp("codeAction")
	end, { desc = "Code Action", buffer = bufnr })
	vim.keymap.set("n", "<leader>dr", function()
		vim.cmd.RustLsp("debuggables")
	end, { desc = "Rust Debuggables", buffer = bufnr })
end

return {
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rust_autosave = 1
		end,
	},
	{
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		config = function()
			require("crates").setup()
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4",
		ft = { "rust" },
		opts = {
			server = {
				capabilities = capabilities,
				on_attach = rust_attach,

				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							loadOutDirsFromCheck = true,
							buildScripts = {
								enable = true,
							},
						},
						checkOnSave = true,
						procMacro = {
							enable = true,
							ignored = {
								["async-trait"] = { "async_trait" },
								["napi-derive"] = { "napi" },
								["async-recursion"] = { "async_recursion" },
							},
						},
					},
				},
			},
		},
		config = function(_, opts)
			vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
		end,
	},
}
