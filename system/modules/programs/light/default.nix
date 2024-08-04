{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.light;
in
{
  options = {
    module.services.light.enable = mkEnableOption "Enables light";
  };

  config = mkIf cfg.enable { programs.light.enable = true; };
}
