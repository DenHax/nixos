return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("plugins.lsp-settings.lsp-setup").capabilites
		local on_attach = require("plugins.lsp-settings.lsp-setup").on_attach
		local servers = {
			-- Lua
			"lua_ls",

			-- Web (TypeScript, JavaScript, HTML, CSS)
			"html",
			"cssls",
			"tailwindcss",
			"ts_ls",
			"emmet_language_server",
			"jsonls",

			-- Rust
			-- "rust_analyzer",

			-- Nix
			"nil_ls",

			-- Go
			"gopls",

			-- Database (SQL, MongoDB, Redis, Kafka)
			"sqls",

			-- Shells (Bash)
			"bashls",

			-- Python
			"pyright",
			-- "basedpyright",

			-- Markups languages, TeX, Markdown
			"marksman",
			"texlab",
			-- "ltex",
		}
		-- local util = require("lspconfig/util")
		for _, server in pairs(servers) do
			local opts = {
				capabilities = capabilities,
				on_attach = on_attach,
			}
			local has_server_opts, server_opts = pcall(require, "plugins.lsp-settings." .. server)
			if has_server_opts then
				opts = vim.tbl_deep_extend("force", server_opts, opts)
			end
			lspconfig[server].setup(opts)
		end
		-- for _, serv in pairs(servers) do
		-- 	if serv == "nil_ls" then
		-- 		lspconfig[serv].setup({
		-- 			on_attach = on_attach,
		-- 			capabilities = capabilities,
		-- 			settings = {
		-- 				["nil"] = {
		-- 					nix = {
		-- 						flake = {
		-- 							autoArchive = true,
		-- 							autoEvalInputs = false,
		-- 						},
		-- 					},
		-- 				},
		-- 			},
		-- 		})
		-- 		goto continue
		-- 	end
		--
		-- 	lspconfig[serv].setup({
		-- 		on_attach = on_attach,
		-- 		capabilities = capabilities,
		-- 	})
		-- 	::continue::
		-- end

		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
		-- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Info about symbol" })
		-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		-- vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename symbol" })
	end,
}
