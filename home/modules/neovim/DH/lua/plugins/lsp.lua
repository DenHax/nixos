return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("plugins.lsp-settings.lsp-setup").capabilites
		local on_attach = require("plugins.lsp-settings.lsp-setup").on_attach
		local servers = {
			"ansiblels",

			-- Bash
			"bashls",

			-- C/C++
			"clangd",

			-- Docker
			"dockerls",
			"docker_compose_language_service",

			-- Go
			"gopls",

			-- Helm
			"helm_ls",

			-- JSON
			"jsonls",

			-- Lua
			"lua_ls",

			-- Nix
			"nixd",
			-- "nil_ls",

			-- PHP
			"phpactor",

			-- Python
			"pyright",
			-- "basedpyright",

			-- Rust
			-- "rust_analyzer",

			-- Database (SQL, MongoDB, Redis, Kafka)
			"sqls",

			-- Web (TypeScript, JavaScript, HTML, CSS)
			"html",
			"cssls",
			"tailwindcss",
			"tsserver",
			"emmet_language_server",

			-- YAML
			"yamlls",
		}
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
