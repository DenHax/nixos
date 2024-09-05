{
  lib,
  config,
  overlayModules,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.services.hyprland;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options.module = {
    services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgsStable.hyprland;
      portalPackage = pkgsStable.xdg-desktop-portal-hyprland;
    #   package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    #   portalPackage =
    #     inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # };

    environment.systemPackages = with pkgs; [ cmake ];
  };
}
