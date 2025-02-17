local options = {
  formatters_by_ft = {
    sh = { "shfmt" },

    lua = { "stylua" },

    -- c =  e;

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
    -- ["markdown.mdx"] = { "prettier" },

    sql = { "sqlfluff" },

    -- rust = { "rustfmt" },
    php = { "php_cs_fixer" },
    python = { "isort", "black" },
  },
  formatters = {
    php_cs_fixer = {
      command = "php-cs-fixer",
      args = { "fix", "$FILENAME" },
      cwd = require("conform.util").root_file {
        "composer.json",
        ".php-cs-fixer.php",
        ".php-cs-fixer.dist.php",
      },
    },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
}

return options
