{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.blueman;
in
{
  options = {
    module.services.blueman.enable = mkEnableOption "Enable blueman";
  };

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };

    services.blueman.enable = true;
  };
}
