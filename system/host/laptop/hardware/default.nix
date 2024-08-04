{
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [ ./hardware-configuration.nix ];

  hardware = {
    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    firmware = with pkgs; [
      sof-firmware
      linux-firmware
    ];
  };
}
