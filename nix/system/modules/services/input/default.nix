{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.input;
in
{
  options = {
    module.services.input.enable = mkEnableOption "Enables input";
  };

  config = mkIf cfg.enable {

    services.libinput = {
      enable = false;
      touchpad = {
        accelProfile = "adaptive";
        accelSpeed = "0.5";
      };
    };
  };
}
