{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.hyprland;
in

{
  imports = [
    # ./bind
    # ./monitor
  ];
  options = {
    module.hyprland.enable = mkEnableOption "Enables hyprland";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
    };
  };
}
