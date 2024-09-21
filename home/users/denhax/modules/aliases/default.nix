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
in
{
  options.module.users.denhax.aliases = {
    enable = mkEnableOption "Enable denhax aliases";
  };

  config = mkIf cfg.enable {
    home.shellAliases.bat_log = "${pkgs.bat_log}/bin/bat_log";
  };
}
