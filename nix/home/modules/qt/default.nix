{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.qt;
in
{
  options = {
    module.qt.enable = mkEnableOption "Enables qt";
  };

  config = mkIf cfg.enable { };
}
