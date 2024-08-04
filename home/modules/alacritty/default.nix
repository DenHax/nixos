{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.alacritty;
in
{
  options = {
    module.alacritty.enable = mkEnableOption "Enables alacritty";
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;
    };
  };
}
