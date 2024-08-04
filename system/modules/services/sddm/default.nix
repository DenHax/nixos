{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.sddm;
in
{
  options = {
    module.services.sddm.enable = mkEnableOption "Enables sddm";
  };

  config = mkIf cfg.enable {

    services.displayManager = {
      sddm = {
        enable = false;
        package = pkgs.libsForQt5.sddm;
        wayland = {
          enable = true;
        };
        settings = {
          Autologin = {
            User = "denhax";
            Session = "hyprland.desktop";
          };
        };
        extraPackages = with pkgs; [
          # layan-kde
          # sddm-sugar-dark
          libsForQt5.qt5.qtquickcontrols2
          libsForQt5.qt5.qtgraphicaleffects
          # libsForQt5.qt5.qtsvg
        ];
        # theme = "sddm-sugar-dark";
        # theme = "${pkgs.layan-kde}/share/sddm/themes/Layan"; # works but dependencies...
        theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
      };
      defaultSession = "hyprland";
    };
  };
}
