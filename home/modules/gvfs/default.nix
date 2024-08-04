{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.gvfs;
in
{
  options = {
    module.gvfs.enable = mkEnableOption "Enables gvfs";
  };

  config = mkIf cfg.enable { services.gvfs.enable = true; };
}
