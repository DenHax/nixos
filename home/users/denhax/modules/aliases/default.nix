{
  config,
  lib,
  inputs,
  pkgs,
  isWorkstation,
  isGame,
  # hostname,
  ...
}:

with lib;

let
  inherit (pkgs.stdenv) isLinux;
  cfg = config.module.users.denhax.packages;
  bat_log = (import "${customPkgs}/bat_log" { inherit pkgs; });
in
{
  options.module.users.denhax.aliases = {
    enable = mkEnableOption "Enable denhax aliases";
  };

  config = mkIf cfg.enable {
    home.shellAliases.bat_log = "${bat_log}";
  };
}
