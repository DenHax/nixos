{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.river;
in
{
  options.module = {
    river.enable = mkEnableOption "Enables ";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland = true;
    };
  };
}
