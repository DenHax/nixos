return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	enable = true,

	opts = {
		ensure_installed = {
			-- Vim, Neovim
			"vim",
			"vimdoc",

			-- Lua
			"lua",

			-- Bash
			"bash",

			-- Web-like lngs
			"html",
			"css",
			"scss",
			"javascript",
			"typescript",
			"tsx",
			"vue",
			"json",

			-- Python
			"python",
			"rst",

			-- Golang
			"go",
			"gomod",
			"gowork",
			"gosum",

			-- Embedded lngs
			"asm",
			"c",
			"rust",
			"ron",
			"toml",

			-- Markup languages
			"markdown_inline",
			"markdown",
			"latex",
			"bibtex",
			"query",
			"regex",

			-- database
			"sql",

			-- Specific languages for config and etc
			"hyprlang",
			"nix",
			"yaml",
			"rasi",

			-- Git
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",

			-- Dockerfile
			"dockerfile",
		},
		highlight = { enable = true, disable = { "help" } },
		indent = { enable = true },
		-- autotag = { enable = true },
		disable = {},
	},

	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
