{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.programs.xdg-portal;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.programs.xdg-portal.enable = mkEnableOption "Enable xdg-portal";
  };

  config = mkIf cfg.enable {
    xdg = {
      portal = {
        enable = true;
        xdgOpenUsePortal = true;
        config = {
          common = {
            default = "*";
            "org.freedesktop.impl.portal.Screencast" = "hyprland";
            "org.freedesktop.impl.portal.Screenshot" = "hyprland";
          };
        };
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgsStable.xdg-desktop-portal-wlr
          # pkgsStable.xdg-desktop-portal-hyprland
        ];
      };
    };
  };
}
