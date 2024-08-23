{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.hyprland;
  flakeDir = "~/nix";
in

{
  imports = [
    ./bind
    ./monitor
  ];
  options = {
    module.hyprland.enable = mkEnableOption "Enables hyprland";
  };
  config = mkIf cfg.enable {
    module.hyprland = {
      bind.enable = mkDefault cfg.enable;
      monitor.enable = mkDefault cfg.enable;
    };

    home.packages = with pkgs; [
      # Hypr ecosystem
      hyprpicker
      # hyprland
      # hyprlock
      # hyprpaper
      # xdg-desktop-portal-hyprland
      hyprshot
      grimblast
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      package = pkgs.hyprland;
      # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      systemd = {
        enable = true;
        extraCommands = lib.mkBefore [
          "systemctl --user stop graphical-session.target"
          "systemctl --user start hyprland-session.target"
        ];
      };
      settings = {
        exec-once = [
          "${pkgs.bash}/bin/bash ${flakeDir}/pkg/waystart/auto.sh"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];
        "$mainMod" = "SUPER";
        "$shiftMod" = "SUPER SHIFT";

        env = [
          "XDG_CURRENT_DESKTOP,Hyprland"
          "XDG_SESSION_DESKTOP,Hyprland"
          "XCURSOR_SIZE,18"
        ];

        debug = {
          disable_logs = false;
          enable_stdout_logs = true;
          damage_tracking = 2;
        };

        input = {
          kb_layout = "us,ru";
          kb_variant = "lang";
          kb_options = "grp:win_space_toggle,ctrl:nocaps";

          follow_mouse = 1;

          touchpad = {
            natural_scroll = false;
          };

          sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };

        general = {
          gaps_in = 5;
          gaps_out = 20;
          border_size = 3;
          # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          # "col.inactive_border" = "rgba(595959aa)";

          layout = "dwindle";

          #no_cursor_warps = false;
        };

        decoration = {
          rounding = 10;

          blur = {
            enabled = false;
            size = 16;
            passes = 2;
            new_optimizations = true;
          };

          drop_shadow = false;
          # shadow_range = 4;
          # shadow_render_power = 3;
          # "col.shadow" = "rgba(1a1a1aee)";
        };

        animations = {
          enabled = true;

          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

          animation = [
            "windows,     1, 7,  myBezier"
            "windowsOut,  1, 7,  default, popin 80%"
            "border,      1, 10, default"
            "borderangle, 1, 8,  default"
            "fade,        1, 7,  default"
            "workspaces,  1, 6,  default"
          ];
        };

        dwindle = {
          pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true; # you probably want this
        };

        gestures = {
          workspace_swipe = true;
          workspace_swipe_fingers = 3;
          workspace_swipe_invert = false;
          workspace_swipe_distance = 200;
          workspace_swipe_forever = true;
        };

        misc = {
          vfr = true;
          animate_manual_resizes = true;
          animate_mouse_windowdragging = true;
          enable_swallow = true;
          render_ahead_of_time = false;
          disable_hyprland_logo = true;
          disable_autoreload = false;
          focus_on_activate = false;
          force_default_wallpaper = 0;
        };
      };
    };
  };
}
