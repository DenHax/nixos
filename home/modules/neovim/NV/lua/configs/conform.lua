local options = {
  formatters_by_ft = {
    sh = { "shfmt" },

    lua = { "stylua" },

    nix = { "nixfmt" },

    go = { "gofmt", "goimports" },

    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
    typescriptreact = { "prettier" },
    javascriptreact = { "prettier" },

    markdown = { "prettier" },
    -- ["markdown.mdx"] = { "prettier" },

    sql = { "sqlfluff" },

    -- rust = { "rustfmt" },
    python = { "isort", "black" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

vim.keymap.set("n", "<leader>cf", function()
  require("conform").format {}
end, { desc = "Formatting" })

return options
