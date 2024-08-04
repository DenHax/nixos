{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.hyprland.bind;

  audioControl = "${pkgs.pulseaudio}/bin/pactl";
  brightnessControl = "${pkgs.brightnessctl}/bin/brightnessctl";
  screenshotArea = "${pkgs.grimblast}/bin/grimblast --notify --freeze copy area";
  screenshotScreen = "${pkgs.grimblast}/bin/grimblast --notify --freeze copy output";
  cliphist = "${pkgs.cliphist}/bin/cliphist list | rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy";
  appLauncher = "rofi -show";
in
{
  options = {
    module.hyprland.bind.enable = mkEnableOption "Enables binds in Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"

        # "${pkgs.swww}/bin/swww init & sleep 0.5 && exec ${pkgs.swww}/bin/swww img /home/maxmur/Pictures/wallpapers/grey_gradient.png --transition-type simple"

        # Autostart
        "[workspace 1 silent] ${pkgs.foot}/bin/foot"
        "[workspace 1 silent] ${pkgs.foot}/bin/foot"
        "[workspace 1 silent] ${pkgs.foot}/bin/foot"

        "[workspace 2 silent] ${pkgs.firefox}/bin/firefox"

        "[workspace 3 silent] ${pkgs.obsidian}/bin/obsidian"
      ];

      # bind = [
      #   "SUPER, F, fullscreen, 1"
      #   # Grouped (tabbed) windows
      #   "SUPER, G, togglegroup"
      #   "SUPER, TAB, changegroupactive, f"
      #   "SUPERSHIFT, TAB, changegroupactive, b"
      #
      # ];

      # bindr = [ "$mainMod, W, exec, pkill waybar || ${pkgs.waybar}/bin/waybar" ];

      binde = [
        # Audio
        "SUPER ,V , exec,     ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%"
        "SUPERSHIFT ,V, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%"
        "SUPER ,M , exec,     ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle"
      ];

      bind = [
        # Move focus with mainMod + arrow keys
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        # Moving windows
        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, l, swapwindow, r"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, j, swapwindow, d"

        # Cycle through workspaces
        "mainMod ALT, h, workspace, m-1"
        "$mainMod ALT, l, workspace, m+1"

        # Window resizing                     X  Y
        "$mainMod CTRL, h, resizeactive, -60 0"
        "$mainMod CTRL, l, resizeactive,  60 0"
        "$mainMod CTRL, k, resizeactive,  0 -60"
        "$mainMod CTRL, j, resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # System
        "$shiftMod CONTROL, L, exec, ${pkgs.systemd}/bin/loginctl lock-session"
        "$mainMod CONTROL, P, exec, systemctl suspend"
        "$shiftMod CONTROL, P, exec, poweroff"

        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, fullscreen,"
        "$mainMod, G, togglefloating,"

        "$mainMod, Return, exec, ${pkgs.kitty}/bin/kitty"
        "$mainMod, E, exec, ${pkgs.pcmanfm}/bin/pcmanfm"
        "$mainMod, R, exec, ${appLauncher} drun -show-icons"
        "$mainMod, C, exec, ${appLauncher} calc "
        # "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
        "$mainMod, V, exec, ${cliphist}"
        # "$mainMod, P,      pseudo, # dwindle"
        # "$mainMod, J,      togglesplit, # dwindle"

        # Hyprshot
        # "$mainMod,  PRINT, exec, hyprshot -m window"
        # ",          PRINT, exec, hyprshot -m output"
        # "$shiftMod, PRINT, exec, hyprshot -m region"

        # "$mainMod CONTROL, PRINT, exec, hyprshot -m window -r DATA.png | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
        # "CONTROL, PRINT, exec, hyprshot -m output -r DATA.png | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"
        # "$shiftMod CONTROL, PRINT, exec, hyprshot -m region -r DATA.png | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png"

        # Screenshots
        ", Print, exec, grim ~/Pirtures/Screenshots/screen-'$(date +%s)'.png"
        "$mainMod, Print, exec, grim -g '$(slurp)' ~/Pictures/Screenshots/screen-'$(date +%s)'.png"

        # Screenshot
        # ", Print, exec, ${screenshotArea}"
        # "SHIFT, Print, exec, ${screenshotScreen}"

        # Brightness
        ",XF86MonBrightnessDown, exec, ${brightnessControl} set 5%-"
        ",XF86MonBrightnessUp, exec,  ${brightnessControl} set +5%"

        # Audio
        ", xf86audioraisevolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%"
        ", xf86audiolowervolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%"
        ", xf86audiomute, exec, ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle"

        # Notifications
        # "SUPER, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # layer rules
      # layerrule =
      #   let
      #     toRegex =
      #       list:
      #       let
      #         elements = lib.concatStringsSep "|" list;
      #       in
      #       "^(${elements})$";
      #
      #     layers = [
      #       "gtk-layer-shell"
      #       "swaync-control-center"
      #       "swaync-notification-window"
      #       "waybar"
      #     ];
      #   in
      #   [
      #     "blur, ${toRegex layers}"
      #     "ignorealpha 0.5, ${toRegex layers}"
      #   ];

      windowrule = [
        # "float, ^(kitty)$"
        "size 980 640,^(kitty)$"
        "center,^(kitty)$"
        "float, ^(imv)$"
        "size 800 450,^(imv)$"
        "center,^(imv)$"
        "float, ^(feh)$"
        "size 800 450,^(feh)$"
        "center,^(feh)$"
        "float, ^(mpv)$"
        "size 800 450,^(mpv)$"
        "center,^(mpv)$"
      ];
      windowrulev2 = [
        # Xdg
        # "float, class:^(xdg-desktop-portal-gtk)$"
        # "size 900 500, class:^(xdg-desktop-portal-gtk)$"
        # "dimaround, class:^(xdg-desktop-portal-gtk)$"

        # Firefox
        # "workspace 2, class:^(firefox)$"

        # Telegram
        # "workspace 2, class:^(org.telegram.desktop)$"
        # "float,size 900 500,title:^(Choose Files)"

        # Obsidian
        # "workspace 4, class:^(obsidian)$"

        # Vesktop
        # "workspace 8, class:^(vesktop)$"

        # Other
        # "float,class:^(via-nativia)$"
        # "float,class:^(imv)$"
      ];
    };
  };
}
