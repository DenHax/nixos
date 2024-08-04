{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.logind;
in
{
  options = {
    module.services.logind.enable = mkEnableOption "Enables logind";
  };

  config = mkIf cfg.enable {

    services.logind.extraConfig = ''
      HandlePowerKey=ignore
      HandlePowerKeyLongPress=poweroff
      IdleAction=suspend-then-hibernate
      IdleActionSec=7min
    '';
  };
}
