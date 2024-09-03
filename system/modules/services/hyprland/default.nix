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
  options = {
    module.services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    nixpkgs.overlays = [
      import
      "${overlayModules}/xdg-hypr { ${inputs} }"
    ];
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
