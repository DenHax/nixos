{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.ags;
in
{
  options.module = {
    ags.enable = mkEnableOption "Enable ags";
  };

  imports = [ inputs.ags.homeManagerModules.default ];

  config = mkIf cfg.enable {
    programs.ags = {
      enable = true;

      configDir = ./config;

      extraPackages = [
        inputs.ags.packages.${pkgs.system}.battery
        pkgs.fzf
        # gtksourceview
        # webkitgtk
        # accountsservice
      ];
    };
  };
}
