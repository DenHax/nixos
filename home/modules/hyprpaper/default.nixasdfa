{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.hyprpaper;
in
{
  options = {
    module.hyprpaper.enable = mkEnableOption "Enables hyprpaper";
  };

  config = mkIf cfg.enable {
    services.hyprpaper = {
      enable = true;
      package = pkgs.hyprpaper;
      settings = {
        preload = [ "~/Pictures/Wallpapers/kanagawa_dark.png" ];
        wallpaper = [ ",~/Pictures/Wallpapers/kanagawa_dark.png" ];
      };
    };
  };
}
