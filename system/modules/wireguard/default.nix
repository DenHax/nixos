{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.wireguard;
in
{
  options.module = {
    wireguard.enable = mkEnableOption "Enables wireguard";
  };

  config = mkIf cfg.enable {
    networking.firewall = {
      checkReversePath = false;
      allowedUDPPorts = [ 51830 ];
    };
  };
}
