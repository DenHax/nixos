{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.fastfetch;
in
{
  options = {
    module.fastfetch.enable = mkEnableOption "Enables fastfetch";
  };

  config = mkIf cfg.enable {

    programs.fastfetch = {
      enable = true;
      settings = {
        # logo = {
        #   source = "nixos_small";
        #   padding = {
        #     right = 1;
        #   };
        # };
        # display = {
        #   binaryPrefix = "si";
        #   color = "blue";
        #   separator = "  ";
        # };
        modules = [
          "os"
          "host"
          "kernel"
          "packages"
          "shell"
          "terminal"
          "terminalfont"
          "wm"
          "lm"
          "theme"
          "icons"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "battery"
          # "locale"
          "break"
          "colors"
        ];
      };
    };
  };
}
