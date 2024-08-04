{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.starhip;
in
{
  options = {
    module.starhip.enable = mkEnableOption "Enables starship";
  };

  config = mkIf cfg.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
    };
  };
}
