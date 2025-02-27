{
  config,
  pkgs,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.services.kubernetes;
  kubeMasterIP = "10.1.1.2";
  kubeMasterHostname = "api.kube";
  kubeMasterAPIServerPort = 6443;
in
{
  options.module = {
    services.kubernetes.enable = mkEnableOption "Enable kubernetes";
  };
  config = mkIf cfg.enable {
    networking.extraHosts = "${kubeMasterIP} ${kubeMasterHostname}";

    environment.systemPackages = with pkgs; [
      kompose
      kubernetes
      # kubectl
    ];
    services.kubernetes = {
      roles = [
        "master"
        "node"
      ];
      masterAddress = kubeMasterHostname;
      apiserverAddress = "https://${kubeMasterHostname}:${toString kubeMasterAPIServerPort}";
      easyCerts = true;
      apiserver = {
        securePort = kubeMasterAPIServerPort;
        advertiseAddress = kubeMasterIP;
      };
      addons.dns.enable = true;
      kubelet.extraOpts = "--fail-swap-on=false";
    };
  };
}
