{
  lib,
  config,
  hostname,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.network;
in
{
  options = {
    module.network.enable = mkEnableOption "Enables network";
  };

  config = mkIf cfg.enable {
    services.netbird.enable = true;
    environment.systemPackages = [ pkgs.netbird-ui ];

    systemd.services.NetworkManager-wait-online.enable = false;

    networking = {
      networkmanager.enable = true;
      firewall.checkReversePath = false;
      networkmanager.wifi.macAddress = "random";
      # useDHCP = mkDefault true;
      hostName = hostname;

      # bridges = {
      #   br0 = {
      #     interfaces = [ "wlp2s0" ];
      #   };
      # };
    };
  };
}
