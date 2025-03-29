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
      enable = true;
      touchpad = {
        accelProfile = "adaptive";
        accelSpeed = "0.5";
      };
    };

    environment.systemPackages = with pkgs; [
      libinput
      libinput-gestures
      touchpad-gestures
    ];

    services.touchegg.enable = true;
    boot.kernelModules = [ "hid_apple" ];
  };
}
