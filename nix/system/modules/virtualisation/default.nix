{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.virtualisation;
in
{
  options = {
    module.virtualisation.enable = mkEnableOption "Enables virtualisation";
  };

  config = mkIf cfg.enable {
    virtualisation = {
      docker = {
        enable = true;
        rootless = {
          enable = true;
          setSocketVariable = true;
        };
      };
      podman = {
        enable = true;

        defaultNetwork.settings.dns_enabled = true;
      };

      libvirtd = {
        enable = true;
      };
    };

    programs.virt-manager = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      qemu
      dive
      podman-tui
      docker-compose
    ];
  };
}
