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
  pkgsStable = import inputs.nixpkgs-stable {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.services.hyprland.enable = mkEnableOption "Enables hyprland";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      package = pkgsStable.hyprland;
    };
  };
}
