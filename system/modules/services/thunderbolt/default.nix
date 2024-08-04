{ lib, config, ... }:

with lib;

let
  cfg = config.module.services.thunderbolt;
in
{
  options = {
    module.services.thunderbolt.enable = mkEnableOption "Enable thunderbolt";
  };

  config = mkIf cfg.enable { services.hardware.bolt.enable = true; };
}
