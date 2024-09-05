{
  lib,
  config,
  # overlayModules,
  # pkgs,
  # inputs,
  ...
}:

with lib;

let
  cfg = config.module.services.hyprland;
in
# pkgsStable = import inputs.nixpkgs-stable {
#   system = pkgs.stdenv.hostPlatform.system;
#   config = {
#     allowUnfree = true;
#   };
# };
{
  options.module = {
    services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      # package = pkgs.hyprland;
      # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };
}
