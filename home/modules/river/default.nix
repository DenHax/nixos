{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.river;
in
{
  options.module = {
    river.enable = mkEnableOption "Enable river";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland = true;
    };
  };
}
