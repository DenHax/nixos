{ config, lib, ... }:

with lib;

let
  cfg = config.module.services.devmon;
in
{
  options.module = {
    services.devmon.enable = mkEnableOption "Enables devmon";
  };

  config = mkIf cfg.enable {
    services.devmon.enable = true;
  };
}
