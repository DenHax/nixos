local options = {
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
      "org",
      "norg",
      "norg_meta",
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
    disable = {
      -- For Neorg.nvim parser
      "norg",
      "norg_meta",
    },
  },
}
