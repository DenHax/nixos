{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.ags;
in
{
  options = {
    module.ags.enable = mkEnableOption "Enables ags";
  };

  config = mkIf cfg.enable { };
}
