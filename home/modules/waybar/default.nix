{
  pkgs,
  config,
  lib,
  hostname,
  homeModules,
  ...
}:

with lib;

let
  cfg = config.module.waybar;
  isLaptop = hostname == "laptop";
in
{
  options = {
    module.waybar.enable = mkEnableOption "Enables waybar";
  };

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          margin = "9 13 -10 18";

          modules-left = [
            "custom/nixlogo"
            # "river-tags"
            "hyprland/workspaces"
            "hyprland/language"
            # "keyboard-state"
            # "hyprland/submap"
            "cpu"
            "temperature"
            "pulseaudio"
          ];
          modules-center = [
            "clock"
            # "custom/weather"
          ];
          modules-right =
            if isLaptop then
              [
                "custom/mem"
                "backlight"
                "battery"
                "tray"
              ]
            else
              [
                "custom/mem"
                "tray"
              ];

          # Logo
          "custom/nixlogo" = {
            format = " ";
            tooltip = false;
            on-click = "rofi -show drun -show-icons";
          };

          "river/tags" = {
            "num-tags" = 6;
            "tag-labels" = [
              "󰫍"
              "󰫍"
              "󰫍"
              "󰫍"
              "󰫍"
              "󰫍"

              ""
              "󰈹"
              "󰭹"
              ""
            ];
          };

          "river/workspaces" = {
            "format" = "{icon}";
            "on-click" = "activate";
            "format-icons" = {
              "1" = "󰫍";
              "2" = "󰫍";
              "3" = "󰫍";
              "4" = "󰫍";
              "5" = "󰫍";
              "6" = "󰫍";
            };
            "tooltip" = false;
            "persistent_workspaces" = {
              "*" = 6;
            };
          };
          "hyprland/workspaces" = {
            disable-scroll = true;
          };

          "hyprland/language" = {
            format-en = "US";
            format-ru = "RU";
            min-length = 5;
            tooltip = false;
          };

          "keyboard-state" = {
            numlock = true;
            capslock = true;
            format = "{icon} ";
            format-icons = {
              locked = " ";
              unlocked = "";
            };
          };

          "clock" = {
            # timezone = "America/New_York";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format = "{:%a %b %d, %H:%M}";
            on-click = "${pkgs.eww}/bin/eww update showcalendar=true";

            actions = {
              on-scroll-down = "shift_down";
              on-scroll-up = "shift_up";
            };
          };

          # "custom/weather" = {
          #   format = "{}";
          #   tooltip = true;
          #   interval = 1800;
          #   exec = "../../pkg/wttr/wttr.nix";
          #   return-type = "json";
          # };

          "pulseaudio" = {
            # scroll-step = 1; # %, can be a float
            reverse-scrolling = 1;
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = "{volume}% ";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              # hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "pavucontrol";
            min-length = 13;
          };

          "custom/mem" = {
            format = "{} ";
            interval = 3;
            exec = "free -h | awk '/Mem:/{printf $3}'";
            tooltip = false;
          };

          "cpu" = {
            interval = 2;
            format = "{usage}% ";
            min-length = 6;
          };

          "temperature" = {
            thermal-zone = 2;
            # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            format-critical = "{temperatureC}°C {icon}";
            format = "{temperatureC}°C {icon}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            tooltip = false;
          };

          "backlight" = {
            device = "intel_backlight";
            format = "{percent}% {icon}";
            format-icons = [ "" ];
            min-length = 7;
          };

          battery = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-alt = "{time} {icon}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            # format-icons = [
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            #   ""
            # ];
          };

          tray = {
            icon-size = 16;
            spacing = 0;
          };

        };
      };

      style = mkAfter ''
        ${builtins.readFile "${homeModules}/waybar/style.css"}
      '';
    };

    stylix.targets.waybar.enable = false;
  };
}
