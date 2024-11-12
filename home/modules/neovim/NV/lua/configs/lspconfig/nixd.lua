local hostName = os.getenv "HOST"
local userName = os.getenv "USER"
local nixPath = os.getenv "FLAKE"
local nixConfigExpr = string.format('(builtins.getFlake "%s").nixosConfigurations.%s.options', nixPath, hostName)
local homeConfigExpr = string.format('(builtins.getFlake "%s").homeConfiguration.%s.options', nixPath, userName)

return {
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        nixos = {
          expr = nixConfigExpr,
        },
        home_manager = {
          expr = homeConfigExpr,
        },
      },
    },
  },
}
