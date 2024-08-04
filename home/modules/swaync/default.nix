{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.swaync;
in
{
  options = {
    module.swaync.enable = mkEnableOption "Enables swwaync";
  };

  config = mkIf cfg.enable {
    services.swaync = {
      enable = true;
    };
  };
}
