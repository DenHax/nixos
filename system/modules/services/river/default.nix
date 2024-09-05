{ config, lib, ... }:

with lib;

let
  cfg = config.module.river;
in
{
  options.module = {
    services.river.enable = mkEnableOption "Enable river";
  };
  config = mkIf cfg.enable {
    programs.river = {
      enable = true;
    };
  };
}
