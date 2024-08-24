{ config, lib, ... }:

with lib;

let
  cfg = config.module.feh;
in
{
  options.module = {
    feh.enable = mkEnableOption "Enable feh";
  };
  config = mkIf cfg.enable {
    programs.feh = {
      enable = true;
    };
  };
}
