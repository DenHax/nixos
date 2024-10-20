{ config, lib, ... }:

with lib;

let
  cfg = config.module.services.udisk;
in
{
  options.module = {
    services.udisk.enable = mkEnableOption "Enables udisk";
  };

  config = mkIf cfg.enable {
    services.devmon.enable = true;
  };
}
