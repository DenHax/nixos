{ config, lib, ... }:

with lib;

let
  cfg = config.module.devmon;
in
{
  options = {
    module.devmon.enable = mkEnableOption "Enables devmon";
  };

  config = mkIf cfg.enable {
    services.devmon.enable = true;
  };
}
