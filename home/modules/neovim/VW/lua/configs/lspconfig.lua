-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  -- Markups languages, TeX, Markdown
  "marksman",
  "texlab",
  "ltex",
}
local nvlsp = require "nvchad.configs.lspconfig"

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
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
