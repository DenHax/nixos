{
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

  config =
    mkIf cfg.enable
      {
      };
}
