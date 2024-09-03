{
  pkgs,
  inputs,
  lib,
  config,
  overlayModules,
  ...
}:

with lib;

let
  cfg = config.module.services.qtile;
in
{
  options.module = {
    services.qtile.enable = mkEnableOption "Enables qtile";
  };

  config = mkIf cfg.enable {
    imports = [
      "${overlayModules}/qtile"
    ];
    services.xserver.windowManager.qtile = {
      enable = true;
    };
  };
}
