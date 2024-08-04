{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.btop;
in
{
  options = {
    module.btop.enable = mkEnableOption "Enables btop";
  };

  config = mkIf cfg.enable {
    programs.btop = {
      enable = true;
      settings = {
        # color_theme = "kanagawa";
        theme_background = false;
        vim_keys = true;
        update_ms = 100;
      };
    };
  };
}
