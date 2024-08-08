{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.dconf;
in
{
  options = {
    module.dconf.enable = mkEnableOption "Enables dconf";
  };

  config = mkIf cfg.enable {
    dconf = {
      # enable = true;
      settings = {
        "org/virt-manager/virt-manager/connections" = {
          autoconnect = [ "qemu:///system" ];
          uris = [ "qemu:///system" ];
        };
      };
    };
  };
}
