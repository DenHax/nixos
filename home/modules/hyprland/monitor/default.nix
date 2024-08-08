{
  config,
  lib,
  hostname,
  ...
}:

with lib;

let
  cfg = config.module.hyprland.monitor;
  # Display (S271HL): 1920x1080 @ 60 Hz in 27″ [External]
  # Display (BOE06DF): 1920x1080 @ 60 Hz in 14″ [Built-in]
  monitorsSettings =
    if hostname == "workstation" then
      # [ "HDMI-A-1,1920x1080@60,1920x0,1" ]
      ",preffered,auto,1"
    else if hostname == "laptop" then
      [
        # "HDMI-A-1,1920x1080@60,1920x0,1"
        # "eDP-1,1920x1080@60,0x0,1"
        ",preffered,auto,1"
      ]
    else
      [ ];

  workspacesSettings =
    if hostname == "workstation" then
      [
        # "1, monitor:HDMI-1, default:true"
        # "2, monitor:HDMI-1, default:true"
        # "3, monitor:HDMI-1, default:true"
        # "4, monitor:HDMI-1, default:true"
        # "5, monitor:HDMI-1, default:true"
        # "6, monitor:HDMI-1, default:true"
        # "7, monitor:HDMI-1, default:true"
        # "8, monitor:HDMI-1, default:true"
        # "9, monitor:HDMI-1, default:true"
        # "10, monitor:HDMI-1, default:true"
      ]
    else if hostname == "laptop" then
      [
        # "1, monitor:eDP-1, default:true"
        # "2, monitor:HDMI-1, default:true"
        # "3, monitor:HDMI-1, default:true"
        # "4, monitor:HDMI-1, default:true"
        # "5, monitor:eDP-1, default:true"
        # "6, monitor:eDP-1, default:true"
        # "7, monitor:eDP-1, default:true"
        # "8, monitor:eDP-1, default:true"
        # "9, monitor:eDP-1, default:true"
        # "10, monitor:eDP-1, default:true"
      ]
    else
      [ ];
in
{
  options = {
    module.hyprland.monitor.enable = mkEnableOption "Enables monitors in Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      monitor = monitorsSettings;
      workspace = workspacesSettings;
    };
  };
}
