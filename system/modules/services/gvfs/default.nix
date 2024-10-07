{ config, lib, ... }:

with lib;

let
  cfg = config.module.services.gvfs;
in
{
  options.module = {
    services.gvfs.enable = mkEnableOption "Enables gvfs";
  };

  config = mkIf cfg.enable {
    services.gvfs.enable = true;
  };
}
