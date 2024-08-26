{ config, lib, ... }:

with lib;

let
  cfg = config.module.lf;
in
{
  options.module = {
    lf.enable = mkEnableOption "Enable lf";
  };

  config = mkIf cfg.enable {
    programs.lf = {
      enable = true;
      commands = {
        dragon-out = ''%${pkgs.xdragon}/bin/xdragon -a -x "$fx"'';

        editor-open = ''$$EDITOR $f'';

        mkdir = ''
          ''${{
          prinf "Directory Name: "
          read DIR
          mkdir $DIR
          }}
        '';
      };

      keybindings = {
        c = "mkdir";
        "." = "set hidden!";
        "`" = "mark-load";
        "\\'" = "mark-load";
        "<enter>" = "open";

        do = "dragon-out";

        "g~" = "cd";
        gh = "cd";
        "g/" = "/";

        ee = "editor-open";
        V = ''''$${pkgs.gat}/bin/gat "$f"'';

        settings = {
          preview = true;
          hidden = true;
          drawbox = true;
          icons = true;
          ignorecase = true;
        };
      };
    };
    # xdg.configFile."lf/icons".source = ./icons;
  };
}
