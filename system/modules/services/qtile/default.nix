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
  imports = [
    "${overlayModules}/qtile"
  ];
  options.module = {
    services.qtile.enable = mkEnableOption "Enables qtile";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.qtile = {
      enable = true;
    };
  };
}
