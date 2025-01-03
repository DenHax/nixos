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
    -- php = { { "pint", "php_cs_fixer" } },
    -- php = { "php-cs-fixer" },
    php = { "pint", "php-codesniffer" },
    python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
  },
}

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format {}
end, { desc = "Formatting" })

return options
