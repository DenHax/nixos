{ config, lib, ... }:

with lib;

let
  cfg = config.module.ranger;
in
{
  options.module = {
    ranger.enable = mkEnableOption "Enable ranger";
  };

  config = mkIf cfg.enable {
    programs.ranger = {
      enable = true;
    };
  };
}
