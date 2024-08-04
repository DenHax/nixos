{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.hypridle;

  # hyprlockCmd = "${config.programs.hyprlock.package}/bin/hyprlock";
  lockCmd = "${pkgs.systemd}/bin/loginctl lock-session";
  suspendCmd = "${pkgs.systemd}/bin/systemctl suspend";
in
{
  options = {
    module.hypridle.enable = mkEnableOption "Enables hypridle";
  };

  config = mkIf cfg.enable {
    services.hypridle = {
      enable = true;
      package = pkgs.hypridle;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
          # unlock_cmd = "";
          before_sleep_cmd = "${lockCmd}";
          after_sleep_cmd = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
          # ignore_dbus_inhibit = false;
        };

        listener = [
          {
            timeout = 240;
            on-timeout = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
            on-resume = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
          }
          {
            timeout = 300;
            on-timeout = lockCmd;
            # on-timeout = "loginctl lock-session";
            on-resume = "";
          }
          {
            timeout = 450;
            on-timeout = suspendCmd;
            on-resume = "hyprctl dispatch dpms on";
            # on-resume = "";
          }
        ];
      };
    };
  };
}
