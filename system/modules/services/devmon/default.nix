{ config, lib, ... }:

with lib;

let
  cfg = config.module.udisk;
in
{
  options = {
    module.udisk.enable = mkEnableOption "Enables udisk";
  };

  config = mkIf cfg.enable {
    services.devmon.enable = true;
  };
}
