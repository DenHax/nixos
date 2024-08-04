local util = require("lspconfig/util")

return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				filetype = { "rust" },
				allFeatures = true,
				root_dir = util.root_pattern("Cargo.toml"),
				loadOutDirsFromCheck = true,
				buildScripts = {
					enable = true,
				},
			},
			-- Add clippy lints for Rust.
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
}
-- return {
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			cargo = {
-- 				filetype = { "rust" },
-- 				root_dir = util.root_pattern("Cargo.toml"),
-- 				allFeatures = true,
-- 			},
-- 		},
-- 	},
-- }
