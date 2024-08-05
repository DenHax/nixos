local lsp = {

	capabilities = require("cmp_nvim_lsp").default_capabilities(),

	on_attach = function(_, bufnr)
		local opts = { buffer = bufnr, noremap = true, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts, { desc = "Go to declaration" })
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, { desc = "Go to definition" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts, { desc = "Go to implementation" })
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts, { desc = "Add workspace folder" })
		vim.keymap.set(
			"n",
			"<space>wr",
			vim.lsp.buf.remove_workspace_folder,
			opts,
			{ desc = "Remove workspace folder" }
		)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts, { desc = "List of workspaces" })
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts, { desc = "Type of definition" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
		vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, opts, { desc = "Rename variable" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts, { desc = "Go to reference" })
		vim.keymap.set("n", "<space>of", vim.diagnostic.open_float, opts, { desc = "Open floating diagnostic" })
		vim.keymap.set("n", "<C-p", vim.diagnostic.goto_prev, opts)
		vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, opts)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts, { desc = "Set diag. to the location list" })
	end,
}

return lsp
