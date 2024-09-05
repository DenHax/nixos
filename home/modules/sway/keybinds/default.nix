{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.sway.keybindings;
  super = "Mod4";

  workspace1 = "workspace number 1";
  workspace2 = "workspace number 2";
  workspace3 = "workspace number 3";
  workspace4 = "workspace number 4";
  workspace5 = "workspace number 5";
  workspace6 = "workspace number 6";
  workspace7 = "workspace number 7";
  workspace8 = "workspace number 8";
  workspace9 = "workspace number 9";
  workspace10 = "workspace number 10";
  workspace11 = "workspace number 11";
  workspace12 = "workspace number 12";

  terminal = "${pkgs.kitty}/bin/kitty";
  screenshotArea = "${pkgs.slurp}/bin/slurp | ${pkgs.grim}/bin/grim -g - - | ${pkgs.wl-clipboard}/bin/wl-copy ";
  screenshotScreen = "${pkgs.grim}/bin/grim -o $(swaymsg -t get_outputs | ${pkgs.jq}/bin/jq -r '.[] | select(.focused) | .name') - | ${pkgs.wl-clipboard}/bin/wl-copy";

  # appLauncher = "${pkgs.rofi}/bin/rofi -monitor $(swaymsg -t get_outputs | ${pkgs.jq}/bin/jq '.[] | select(.focused) | .name' -r) -show";
  # audioControl = "${pkgs.pulseaudio}/bin/pactl";
  appLauncher = "rofi -show dmenu -show-icons";
  brightnessControl = "${pkgs.brightnessctl}/bin/brightnessctl";
  clipHist = "${pkgs.cliphist}/bin/cliphist list | rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy";
  notificationsApp = "${pkgs.swaynotificationcenter}/bin/swaync-client -t -sw";
in
{
  options.module.sway.keybindings = {
    enable = mkEnableOption "Enable sway keybindings";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.sway.config = {
      inherit terminal;
      modifier = super;

      assigns = {
        "2" = [ { app_id = "org.telegram.desktop"; } ];
        "4" = [ { app_id = "obsidian"; } ];
        "8" = [ { app_id = "vesktop"; } ];
      };

      keybindings = {
        # Terminal
        "--to-code ${modifier}+Return" = "exec ${terminal}";

        # Kill active window
        "--to-code ${modifier}+q" = "kill";

        # Change focus
        # Vim like
        "--to-code ${modifier}+h" = "focus left";
        "--to-code ${modifier}+j" = "focus down";
        "--to-code ${modifier}+k" = "focus up";
        "--to-code ${modifier}+l" = "focus right";

        # With arrows
        "--to-code ${modifier}+Left" = "focus left";
        "--to-code ${modifier}+Down" = "focus down";
        "--to-code ${modifier}+Up" = "focus up";
        "--to-code ${modifier}+Right" = "focus right";

        # Move focused window
        # Vim like
        "--to-code ${modifier}+Shift+h" = "move left";
        "--to-code ${modifier}+Shift+j" = "move down";
        "--to-code ${modifier}+Shift+k" = "move up";
        "--to-code ${modifier}+Shift+l" = "move right";

        # With arrows
        "--to-code ${modifier}+Shift+Left" = "move left";
        "--to-code ${modifier}+Shift+Down" = "move down";
        "--to-code ${modifier}+Shift+Up" = "move up";
        "--to-code ${modifier}+Shift+Right" = "move right";

        # Application launcher
        "--to-code Ctrl+Space" = "exec ${appLauncher}";
        "--to-code ${modifier}+c" = "exec ${clipHist}";

        # Multimedia keys
        "--to-code xf86audioraisevolume" = "exec ${audioControl} set-sink-volume @DEFAULT_SINK@ +5%";
        "--to-code xf86audiolowervolume" = "exec ${audioControl} set-sink-volume @DEFAULT_SINK@ -5%";
        "--to-code xf86audiomute" = "exec ${audioControl} set-sink-mute @DEFAULT_SINK@ toggle";
        "--to-code XF86MonBrightnessDown" = "exec ${brightnessControl} set 5%-";
        "--to-code XF86MonBrightnessUp" = "exec ${brightnessControl} set +5%";

        # Notifications
        "--to-code ${modifier}+n" = "exec ${notificationsApp}";

        # Screenshot
        "--to-code Print" = "exec ${screenshotArea}";
        "--to-code Shift+Print" = "exec ${screenshotScreen}";

        # Reload the configuration file
        "--to-code ${modifier}+Shift+r" = "reload";

        # Fullscreen mode
        "--to-code ${modifier}+f" = "fullscreen";

        # Resize mode
        "--to-code ${modifier}+r" = "mode resize";

        # Layouts
        "--to-code ${modifier}+v" = "splitv";
        "--to-code ${modifier}+b" = "splith";
        "--to-code ${modifier}+s" = "layout toggle split";
        "--to-code ${modifier}+t" = "layout tabbed";

        # Switch to workspace using number row
        "--to-code ${modifier}+1" = "${workspace1}";
        "--to-code ${modifier}+2" = "${workspace2}";
        "--to-code ${modifier}+3" = "${workspace3}";
        "--to-code ${modifier}+4" = "${workspace4}";
        "--to-code ${modifier}+5" = "${workspace5}";
        "--to-code ${modifier}+6" = "${workspace6}";
        "--to-code ${modifier}+7" = "${workspace7}";
        "--to-code ${modifier}+8" = "${workspace8}";
        "--to-code ${modifier}+9" = "${workspace9}";
        "--to-code ${modifier}+0" = "${workspace10}";
        "--to-code ${modifier}+minus" = "${workspace11}";
        "--to-code ${modifier}+equal" = "${workspace12}";

        # Switch to scratchpad
        "--to-code ${modifier}+z" = "scratchpad show";

        # Move window to workspace using number row
        "--to-code ${modifier}+Shift+1" = "move container to ${workspace1}";
        "--to-code ${modifier}+Shift+2" = "move container to ${workspace2}";
        "--to-code ${modifier}+Shift+3" = "move container to ${workspace3}";
        "--to-code ${modifier}+Shift+4" = "move container to ${workspace4}";
        "--to-code ${modifier}+Shift+5" = "move container to ${workspace5}";
        "--to-code ${modifier}+Shift+6" = "move container to ${workspace6}";
        "--to-code ${modifier}+Shift+7" = "move container to ${workspace7}";
        "--to-code ${modifier}+Shift+8" = "move container to ${workspace8}";
        "--to-code ${modifier}+Shift+9" = "move container to ${workspace9}";
        "--to-code ${modifier}+Shift+0" = "move container to ${workspace10}";
        "--to-code ${modifier}+Shift+minus" = "move container to ${workspace11}";
        "--to-code ${modifier}+Shift+equal" = "move container to ${workspace12}";

        # Move window to scratchpad
        "--to-code ${modifier}+Shift+z" = "move scratchpad";
      };

      modes = {
        resize = {
          # Vim like binds
          "h" = "resize shrink width 10px";
          "j" = "resize shrink height 10px";
          "k" = "resize shrink height 10px";
          "l" = "resize shrink width 10px";

          # Arrows
          "Left" = "resize shrink width 10px";
          "Down" = "resize shrink height 10px";
          "Up" = "resize shrink height 10px";
          "Right" = "resize shrink width 10px";

          # Vim like binds
          "Shift+h" = "resize grow width 10px";
          "Shift+j" = "resize grow height 10px";
          "Shift+k" = "resize grow height 10px";
          "Shift+l" = "resize grow width 10px";

          # Arrows
          "Shift+Left" = "resize grow width 10px";
          "Shift+Down" = "resize grow height 10px";
          "Shift+Up" = "resize grow height 10px";
          "Shift+Right" = "resize grow width 10px";

          # Return to normal mode
          "Escape" = "mode default";
          "Return" = "mode default";
        };
      };
    };
  };
}
