local options = {
  liners_by_ft = {
    bash = { "shellcheck" },
    lua = { "selene" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    typescriptreact = { "eslint_d" },
    python = { "ruff", "mypy" },
    sql = { "sqlfluff" },
  },
}
return options
