{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.fish;
in
{
  options = {
    module.fish.enable = mkEnableOption "Enables fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      interactiveShellInit = # sh
        ''
          set fish_greeting
          function fish_user_key_bindings
            fish_vi_key_bindings
          end
        '';

      shellAliases = {
        "b" = "bat";
        "ll" = "ls -l";
        "e" = "eza --icons -F -H --group-directories-first --git";
        "ea" = "eza -a";
        "el" = "eza --icons -F -H --group-directories-first --git -all";
        "se" = "sudoedit";
        "ff" = "fastfetch";
        "tree" = "eza --tree --level=4 --icons";
        "h" = "history";
      };

      plugins = [
        {
          name = "autopair";
          inherit (pkgs.fishPlugins.autopair) src;
        }
        {
          name = "done";
          inherit (pkgs.fishPlugins.done) src;
        }
      ];
    };
  };
}
