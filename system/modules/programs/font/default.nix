{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.programs.font;
in
{
  options = {
    module.programs.font.enable = mkEnableOption "Enable font";
  };

  config = mkIf cfg.enable {

    fonts = {
      fontconfig = {
        enable = true;
        defaultFonts = {
          serif = [ "FiraCode Nerd Font" ];
          sansSerif = [ "FiraCode Nerd Font" ];
          monospace = [ "FiraCode Nerd Font Mono" ];
        };
      };

      packages = with pkgs; [
        liberation_ttf
        fira-sans
        fira-mono
        fira-code
        fira-code-symbols
        fira-code-nerdfont
        fantasque-sans-mono
        font-awesome
        corefonts
        (nerdfonts.override {
          fonts = [
            "FiraCode"
            "NerdFontsSymbolsOnly"
          ];
        })
      ];
    };
  };
}
