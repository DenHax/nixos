-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  -- Lua
  "lua_ls",

  -- Web (TypeScript, JavaScript, HTML, CSS)
  "html",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "emmet_language_server",
  -- "jsonls",

  -- Rust
  -- "rust_analyzer",

  -- Nix
  "nil_ls",

  -- Go
  "gopls",

  -- Database (SQL, MongoDB, Redis, Kafka)
  "sqls",

  -- Shells (Bash)
  "bashls",

  -- Python
  "pyright",
  -- "basedpyright",
}
local nvlsp = require "nvchad.configs.lspconfig"
-- local util = require "nvchad.configs.lspconfig/util"

-- local opt = {}
-- lsps with default config
for _, lsp in ipairs(servers) do
  -- local has_server_opts, server_opts = pcall(require, "plugins.lsp-settings." .. lsp)
  -- if has_server_opts then
  -- 	opts = vim.tbl_deep_extend("force", server_opts, opts)
  -- end
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  -- root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unisedparams = true,
      },
    },
  },
}
