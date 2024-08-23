{
  pkgs,
  config,
  lib,
  hostname,
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
            "hyprland/workspaces"
            "hyprland/language"
            # "keyboard-state"
            # "hyprland/submap"
          ];
          modules-center = [
            "clock"
            # "custom/weather"
          ];
          modules-right = [
            "pulseaudio"
            "custom/mem"
            "cpu"
            (if isLaptop then "backlight" else "")
            (if isLaptop then "battery" else "")
            "tray"
          ];

          # Logo
          "custom/nixlogo" = {
            format = " ";
            tooltip = false;
            on-click = "rofi -show";
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

          # "keyboard-state" = {
          #numlock = true;
          # capslock = true;
          # format = "{icon} ";
          # format-icons = {
          # locked = " ";
          # unlocked = "";
          # };
          # };

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
            # thermal-zone = 2;
            # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
            critical-threshold = 80;
            # format-critical = "{temperatureC}°C {icon}";
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
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
              ""
            ];
          };

          tray = {
            icon-size = 16;
            spacing = 0;
          };

        };
      };

      style = # scss
        ''
          * {
              border: none;
              border-radius: 0;
              /* `otf-font-awesome` is required to be installed for icons */
              font-family: FiraCode Nerd Font;
              font-weight: bold; 
              min-height: 16px;
          }

          window#waybar {
              background: transparent;
          }

          window#waybar.hidden {
              opacity: 0.2;
          }

          #workspaces {
              margin-right: 8px;
              border-radius: 10px;
              transition: none;
              background: #383c4a;
          }

          #workspaces button {
              transition: none;
              color: #7c818c;
              background: transparent;
              padding: 5px;
              font-size: 18px;
          }

          #workspaces button.persistent {
              color: #7c818c;
              font-size: 12px;
          }

          #workspaces button:hover {
              transition: none;
              box-shadow: inherit;
              text-shadow: inherit;
              border-radius: inherit;
              color: #383c4a;
              background: #7c818c;
          }

          #workspaces button.active {
              background: #4e5263;
              color: white;
              border-radius: inherit;
          }

          #language {
              padding-left: 16px;
              padding-right: 8px;
              border-radius: 10px 10px 10px 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }


          #custom-pacman {
              padding-left: 16px;
              padding-right: 8px;
              border-radius: 10px 0px 0px 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #custom-mail {
              margin-right: 8px;
              padding-right: 16px;
              border-radius: 0px 10px 10px 0px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #submap {
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #clock {
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px 10px 10px 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #pulseaudio {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #pulseaudio.muted {
              background-color: #90b1b1;
              color: #2a5c45;
          }

          #custom-mem {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #cpu {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #temperature {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #temperature.critical {
              background-color: #eb4d4b;
          }

          #backlight {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #battery {
              margin-right: 8px;
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          #battery.charging {
              color: #ffffff;
              background-color: #26A65B;
          }

          #battery.warning:not(.charging) {
              background-color: #ffbe61;
              color: black;
          }

          #battery.critical:not(.charging) {
              background-color: #f53c3c;
              color: #ffffff;
              animation-name: blink;
              animation-duration: 0.5s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
          }

          #tray {
              padding-left: 16px;
              padding-right: 16px;
              border-radius: 10px;
              transition: none;
              color: #ffffff;
              background: #383c4a;
          }

          @keyframes blink {
              to {
                  background-color: #ffffff;
                  color: #000000;
              }
          }
        '';
    };
  };
}
