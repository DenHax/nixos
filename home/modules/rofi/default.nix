{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.rofi;
in
{
  options = {
    module.rofi.enable = mkEnableOption "Enables rofi";
  };

  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      cycle = false;
      package = pkgs.rofi-wayland;
      location = "center";
      terminal = "kitty";

      plugins = with pkgs; [
        rofi-calc
        rofi-emoji
      ];
    };

    xdg.configFile."rofi" = {
      source = ./config;
      recursive = true;
    };
  };
}
