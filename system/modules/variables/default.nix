{
  lib,
  config,
  username,
  ...
}:

with lib;

let
  cfg = config.module.variables;
in
{
  options = {
    module.variables.enable = mkEnableOption "Enables variables";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # VDPAU_DRIVER = mkIf config.hardware.opengl.enable (mkDefault "va_gl");
      QT_QPA_PLATFORM = "wayland";
      XDG_SCREENSHOTS_DIR = "~/Pictures/Screenshots";
      XDG_PICTURES_DIR = "~/Pictures";
      SDL_VIDEODRIVER = "wayland";
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland";
      NIXPKGS_ALLOW_UNFREE = "1";
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
    };

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
      FLAKE = "/home/${username}/nix";
      # QT_QPA_PLATFORMTHEME = "gtk3";
    };
  };
}
