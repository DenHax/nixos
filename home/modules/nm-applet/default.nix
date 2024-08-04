{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.network-manager-applet;
in
{
  options = {
    module.network-manager-applet.enable = mkEnableOption "Enables nm applet";
  };

  config = mkIf cfg.enable { services.network-manager-applet.enable = true; };
}
