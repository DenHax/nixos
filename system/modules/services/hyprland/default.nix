{
  pkgs,
  inputs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.hyprland;
in
{
  options = {
    module.services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgs.hyprland;
    };
  };
}
