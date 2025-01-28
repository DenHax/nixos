{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.module.scanner;
in
{
  options = {
    module.scanner.enable = mkEnableOption "Enables scanner";
  };

  config = mkIf cfg.enable {
    hardware.sane.enable = true;
    # environment.systemPackages = with pkgs; [
    #   sane-backends
    #   sane-frontends
    # ];
  };
}
