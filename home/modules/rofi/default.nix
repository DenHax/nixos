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

  # (pkgs.rofi-calc.override (previous: {
  #   rofi-calc = previous.rofi-calc.overrideAttrs { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
  # }))
  # (pkgs.rofi-emoji.override (previous: {
  #   rofi-emoji = previous.rofi-emoji.overrideAttrs { rofi-unwrapped = prev.rofi-wayland-unwrapped; };
  # }))
  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      cycle = false;
      package = pkgs.rofi-wayland;
      location = "center";
      terminal = "kitty";

      plugins = [
        pkgs.rofi-calc
        # pkgs.rofi-emoji
      ];
    };

    xdg.configFile."rofi" = {
      source = ./config;
      recursive = true;
    };
  };
}
