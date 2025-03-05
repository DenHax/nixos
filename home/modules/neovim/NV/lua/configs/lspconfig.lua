-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  -- Ansible
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
  -- "phpactor",
  "intelephense",

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
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
  local has_server_opts, server_opts = pcall(require, "configs.lspconfig." .. lsp)
  if has_server_opts then
    opts = vim.tbl_deep_extend("force", server_opts, opts)
  end
  lspconfig[lsp].setup(opts)
end
