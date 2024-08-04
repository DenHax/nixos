{ lib, config, ... }:

with lib;

let
  cfg = config.module.services.syncthing;
in
{
  options = {
    module.services.syncthing.enable = mkEnableOption "Enable syncthing";
  };

  config = mkIf cfg.enable {
    services.syncthing = {
      enable = true;
      user = "denhax";
      # dataDir = "/home/denhax/Documents";
      # configDir = "/home/denhax/.config/syncthing";
    };
  };
}
