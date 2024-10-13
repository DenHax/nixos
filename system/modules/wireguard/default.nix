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
      allowedUDPPorts = [ 51830 ];
    };
    networking.wireguard.interfaces = {
      wg0 = {
        ips = [ "10.0.0.3/32" ];
        listenPort = 51830;
        privateKeyFile = "/home/denhax/.sec/wg_pr";
        peers = [
          {
            publicKey = "H+50yJ72znMwdAPkGvDzz/chJWWunSurrxnreYU8Llo=";
            allowedIPs = [ "0.0.0.0/0" ];
            endpoint = "5.39.249.80:51830";
            persistentKeepalive = 20;
          }
        ];
      };
    };
  };
}
