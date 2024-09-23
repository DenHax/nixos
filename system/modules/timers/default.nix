{
  config,
  lib,
  customPkgs,
  pkgs,
  ...
}:
let
  bat_log = (import "${customPkgs}/bat_log" { inherit pkgs; });

in

# with lib;
#
# let
#   cfg = config.module.timers;
# in
# {
#   options.module = {
#     timers.enable = mkEnableOption "Enable timers";
#   };
#   config = mkIf cfg.enable 
{
  systemd.services.logBattery = {
    description = "Log battery status to ~/log/bat_log.txt";
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c ${bat_log}";
    };
    wantedBy = [ "multi-user.target" ];
  };

  systemd.timers.logBatteryTimer = {
    description = "Run logBattery service every 10 minutes";
    wants = [ "logBattery.service" ];
    timerConfig = {
      OnBootSec = "1min";
      OnUnitActiveSec = "10min";
      Persistent = true;
    };
    wantedBy = [ "timers.target" ];
  };
}
#;
# }
