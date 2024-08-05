{ config, lib, ... }:

with lib;

let
  cfg = config.module.starship;
in
{
  options = {
    module.starship.enable = mkEnableOption "Enables starship";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = false;
    };
  };
}
