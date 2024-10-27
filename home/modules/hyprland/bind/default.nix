{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.hyprland.bind;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };

  # Utils (light, clips, audio)
  audioControl = "${pkgs.pulseaudio}/bin/pactl";
  brightnessControl = "${pkgs.brightnessctl}/bin/brightnessctl";
  cliphist = "${pkgs.cliphist}/bin/cliphist list | rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy";
  appLauncher = "rofi -show";
  terminal = "${pkgs.kitty}/bin/kitty";
  filemanager = "${pkgs.pcmanfm}/bin/pcmanfm";
  picker = "${pkgs.hyprpicker}/bin/hyprpicker -a";

  # Screenshots and recorders
  grimBlastCmd = "${pkgs.grimblast}/bin/grimblast --notify --freeze";
  grimBlastMonitorCmd = "${pkgs.grimblast}/bin/grimblast --notify --freeze copysave output";
  grimBlastRegionCmd = "${pkgs.grimblast}/bin/grimblast --notify --freeze copysave area";
  grimBlastWindowCmd = "${pkgs.grimblast}/bin/grimblast --notify --freeze copysave active";

  grimMonitorCmd = "grim ~/Pirtures/Screenshots/screen-\"$(date +%s)\".png";
  grimRegionCmd = "grim -g \"$(slurp)\" ~/Pictures/Screenshots/screen-\"$(date +%s)\".png";

  hyprshotMoniroeCmd = "hyprshot -m output";
  hyprshotRegionCmd = "hyprshot -m region";
  hyprshotWindowCmd = "hyprshot -m window";

  sattyCmd = "satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png";

in
{
  options.module = {
    hyprland.bind.enable = mkEnableOption "Enables binds in Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        # Clipboad init
        "wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store"
        "wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store"
      ];

      # bind = [
      #   "SUPER, F, fullscreen, 1"
      #   # Grouped (tabbed) windows
      #   "SUPER, G, togglegroup"
      #   "SUPER, TAB, changegroupactive, f"
      #   "SUPERSHIFT, TAB, changegroupactive, b"
      #
      # ];

      # env = [ "HYPRSHOT_DIR,Pictures/Screenshots" ];

      bind = [
        # Motion with windows
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, swapwindow, l"
        "$mainMod SHIFT, l, swapwindow, r"
        "$mainMod SHIFT, k, swapwindow, u"
        "$mainMod SHIFT, j, swapwindow, d"

        "$mainMod CTRL, h, resizeactive, -60 0"
        "$mainMod CTRL, l, resizeactive,  60 0"
        "$mainMod CTRL, k, resizeactive,  0 -60"
        "$mainMod CTRL, j, resizeactive,  0  60"

        # Motions with workspaces
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

        "$mainMod ALT, h, workspace, m-1"
        "$mainMod ALT, l, workspace, m+1"

        # System and Windows actyvity
        "$shiftMod CONTROL, L, exec, ${pkgs.systemd}/bin/loginctl lock-session"
        "$mainMod  CONTROL, P, exec, ${pkgs.systemd}/bin/systemctl suspend"
        "$shiftMod CONTROL, P, exec, ${pkgs.systemd}/bin/systemctl poweroff"

        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, fullscreen,"
        "$mainMod, G, togglefloating,"

        # Apps and utils shortcuts
        "$mainMod, Return, exec, ${terminal}"
        "$mainMod, E, exec, ${filemanager}"
        "$mainMod, R, exec, ${appLauncher} drun -show-icons"
        "$mainMod, C, exec, ${appLauncher} calc"
        "$mainMod, V, exec, ${cliphist}"
        # "$mainMod, P,       pseudo,      # dwindle"
        "$mainMod, P,       exec, ${picker}"
        "$mainMod, J,       togglesplit, # dwindle"

        # Screenshots and Screenrecords
        ",          PRINT, exec, ${grimBlastRegionCmd} ~/Pictures/Screenshots/grimblast-\"$(date +%s)\".png"
        "$mainMod,  PRINT, exec, ${grimBlastMonitorCmd} ~/Pictures/Screenshots/grimblast-\"$(date +%s)\".png"
        # "$shiftMod, PRINT, exec, ${grimBlastWindowCmd} ~/Pictures/Screenshots/grimblast-\"$(date +%s)\".png"

        "CONTROL,           PRINT, exec, ${grimBlastCmd} area - | ${sattyCmd} - | wl-copy"
        "$mainMod CONTROL,  PRINT, exec, ${grimBlastCmd} output - | ${sattyCmd} - | wl-copy"
        # "$shiftMod CONTROL, PRINT, exec, ${grimBlastCmd} active | ${sattyCmd} - | wl-copy"

        # Brightness
        ",XF86MonBrightnessDown, exec, ${brightnessControl} set 5%-"
        ",XF86MonBrightnessUp,   exec, ${brightnessControl} set +5%"

        # Audio
        ", xf86audioraisevolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%"
        ", xf86audiolowervolume, exec, ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%"
        ", xf86audiomute,        exec, ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle"

        # Notifications
        "$mainMod, N, exec, ${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up,   workspace, e-1"

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
        "float, ^(imv)$"
        "size 800 450,^(imv)$"
        "center,^(imv)$"
        "float, ^(mpv)$"
        "size 800 450,^(mpv)$"
        "center,^(mpv)$"
        # "float, ^(feh)$"
        # "size 800 450,^(feh)$"
        # "center,^(feh)$"
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
