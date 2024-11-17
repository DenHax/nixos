{
  config,
  lib,
  pkgs,
  username,
  ...
}:

with lib;

let
  cfg = config.module.services.rdp;
in
{
  options.module = {
    services.rdp.enable = mkEnableOption "Enable rdp";
  };
  config = mkIf cfg.enable {
    services.xrdp = {
      enable = true;
      defaultWindowManager = "${pkgs.gnome-remote-desktop}/bin/gnome-remote-desktop";
      openFirewall = true;
    };
  };
}
