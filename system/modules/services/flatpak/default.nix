{ config, lib, ... }:

with lib;

let
  cfg = config.module.services.flatpak;
in
{
  options.module.services = {
    flakpak.enable = mkEnableOption "Enables flatpak";
  };

  config = mkIf cfg.enable {
    services.flatpak.enable = true;
  };
}
