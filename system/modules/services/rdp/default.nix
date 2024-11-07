{
  config,
  lib,
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
      defaultWindowManager = "Hyprland";
      openFirewall = true;
    };
  };
}
