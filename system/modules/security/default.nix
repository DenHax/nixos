{ lib, config, ... }:
with lib;
let
  cfg = config.module.security;
in
{
  options = {
    module.security.enable = mkEnableOption "Enables security";
  };

  config = mkIf cfg.enable {
    security = {
      sudo = {
        enable = false;
      };
      # lockKernelModules = true;
      # protectKernelImage = true;
      # forcePageTableIsolation = true;
      # pam.services.swaylock = { };
      doas = {
        enable = true;
        extraRules = [
          {
            users = [ "denhax" ];
            keepEnv = true;
            persist = true;
          }
        ];
      };
    };
  };
}
