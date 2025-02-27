{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.services.printing;

in
{
  options.module = {
    services.printing.enable = mkEnableOption "Enables printing";
  };

  config = mkIf cfg.enable {
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        gutenprint
        cnijfilter2
        canon-cups-ufr2
        canon-capt
      ];
    };
    hardware.printers = {
      ensurePrinters = [
        {
          name = "Canon_LBP29000B";
          location = "Home";
          deviceUri = "usb://Canon/LBP2900?serial=0000A485IGMS";
          model = "canon/CanonLBP-2900-3000.ppd";
          # gutenprint.5.3://canon-lbp-1760/expert
          ppdOptions = {
            PageSize = "A4";
          };
        }
      ];
    };
  };
}
