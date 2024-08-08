{ lib, config, ... }:

with lib;

let
  cfg = config.module.services.auto-cpufreq;
in
{
  options = {
    module.services.auto-cpufreq.enable = mkEnableOption "Enable auto-cpufreq";
  };

  config = mkIf cfg.enable {
    services.auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          governor = "powersave";
          turbo = "never";
          energy_performance_preference = "power";
          # epp = "power";
          scaling_max_freq = 2666666;
        };
        charger = {
          gevernor = "balanced";
          turbo = "never";
        };
      };
    };
  };
}
