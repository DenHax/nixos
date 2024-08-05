{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.awesome;
in
{
  options = {
    module.awesome.enable = mkEnableOption "Enables awesome";
  };

  config = mkIf cfg.enable {
    xsession.windowManager.awesome = {
      enable = true;
    };
  };
}
