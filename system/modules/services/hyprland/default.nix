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
  cfg = config.module.services.hyprland;
in
{
  nixpgs.overlay = [
    import
    "${overlayModules}/xdg-hypr"
  ];
  options = {
    module.services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
