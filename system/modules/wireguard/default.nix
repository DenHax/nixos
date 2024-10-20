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
    networking.wg-quick.interfaces = {
      wg0 = {
        address = [
          "10.0.0.3/32"

          # "10.0.0.2/24"
          # "fdc9:281f:04d7:9ee9::2/64"
        ];
        dns = [
          "10.0.0.1"

          # "fdc9:281f:04d7:9ee9::1"
        ];
        privateKeyFile = "/home/denhax/.sec/wir/private";

        peers = [
          {
            publicKey = "H+50yJ72znMwdAPkGvDzz/chJWWunSurrxnreYU8Llo=";
            endpoint = "5.39.249.80:51830";
            persistentKeepalive = 20;
            allowedIPs = [
              "0.0.0.0/0"
              "::/0"
            ];
            # presharedKeyFile = "/root/wireguard-keys/preshared_from_peer0_key";
          }
        ];
      };
    };
    # networking.wireguard.interfaces = {
    #   wg0 = {
    #     ips = [ "10.0.0.3/32" ];
    #     listenPort = 51830;
    #     privateKeyFile = "/home/denhax/.sec/wir/private";
    #     peers = [
    #       {
    #         publicKey = "H+50yJ72znMwdAPkGvDzz/chJWWunSurrxnreYU8Llo=";
    #         allowedIPs = [ "0.0.0.0/0" ];
    #         endpoint = "5.39.249.80:51830";
    #         persistentKeepalive = 20;
    #       }
    #     ];
    #   };
    # };
  };
}
