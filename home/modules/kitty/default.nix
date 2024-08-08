{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.kitty;
in
{
  options = {
    module.kitty.enable = mkEnableOption "Enables kitty";
  };

  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "FiraCode Nerd Font";
        size = 13;
      };
      settings = {
        # background_opacity = "0.95";
      };
      extraConfig = ''
        italic_font      Fantasque Sans Mono Italic
        bold_italic_font Fantasque Sans Mono Bold Italic
      '';
      theme = "Kanagawa";
    };
  };
}
