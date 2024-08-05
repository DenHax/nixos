{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.eww;
in
{
  options = {
    module.eww.enable = mkEnableOption "Enables eww";
  };

  config = mkIf cfg.enable { };
}
