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
    # networking.wg-quick.interfaces = {
    #   wg0 = {
    #     address = [
    #       "10.0.0.3/32"
    #     ];
    #     dns = [
    #       "10.0.0.1"
    #     ];
    #     privateKeyFile = "/home/denhax/.sec/wir/private";
    #
    #     peers = [
    #       {
    #         publicKey = "H+50yJ72znMwdAPkGvDzz/chJWWunSurrxnreYU8Llo=";
    #         endpoint = "5.39.249.80:51830";
    #         persistentKeepalive = 20;
    #         allowedIPs = [
    #           "0.0.0.0/0"
    #         ];
    #       }
    #     ];
    #   };
    # };
  };
}
