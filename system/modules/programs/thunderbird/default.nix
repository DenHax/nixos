{ lib, config, ... }:

with lib;

let
  cfg = config.module.programs.thunderbird;
in
{
  options.module = {
    programs.thunderbird.enable = mkEnableOption "Enable thunderbird";
  };

  config = mkIf cfg.enable {
    programs.thunderbird = {
      enable = true;
      profiles = {
        "main" = {
          isDefault = true;

          settings = {
            "calendar.alarms.showmissed" = false;
            "calendar.alarms.playsound" = false;
            "calendar.alarms.show" = false;
          };
        };
      };
    };
  };
}
