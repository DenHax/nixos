{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.hyprlock;
in
{
  options = {
    module.hyprlock.enable = mkEnableOption "Enables hyprlock";
  };

  config = mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      package = pkgs.hyprlock;

      settings = {
        general = {
          disable_loading_bar = false;
          grace = 0;
          hide_cursor = true;
          no_fade_in = false;
          no_fade_out = false;
          ignore_empty_input = false;
        };

        background = [
          {
            monitor = "";
            path = "/home/denhax/Pictures/Wallpapers/kanagawa.png";
            color = "rgba(25, 20, 20, 1.0)";
            blur_size = 8;
            blur_passes = 2;
            noise = 1.17e-2;
            contrast = 0.8917;
            brightness = 0.5;
            vibrancy = 0.1686;
            vibrancy_darkness = 5.0e-2;
          }
        ];

        input-field = [
          {
            monitor = "";
            size = "250, 60";
            outline_thickness = 2;
            dots_size = 0.2;
            dots_spacing = 0.2;
            dots_center = true;
            dots_rounding = -1;
            outer_color = "rgba(0, 0, 0, 0)";
            inner_color = "rgba(0, 0, 0, 0.5)";
            font_color = "rgb(200, 200, 200)";
            fade_on_empty = false;
            fade_timeout = 1000;
            placeholder_text = ''<b><span foreground="##cdd6f4">Input Password...</span></b>'';
            hide_input = false;
            rounding = -1;
            shadow_passes = 0;
            shadow_size = 3;
            shadow_color = "rgba(0, 0, 0, 1.0)";
            shadow_boost = 1.2;
            check_color = "rgb(204, 136, 34)";
            fail_color = "rgb(204, 34, 34)";
            fail_text = "<i>$FAIL</i>";
            fail_transition = 300;
            capslock_color = -1;
            numlock_color = -1;
            bothlock_color = -1;
            invert_numlock = false;
            swap_font_color = false;
            position = "0, -150";
            halign = "center";
            valign = "center";
          }
        ];

        label = [
          {
            monitor = "";
            text = "$TIME";
            color = "rgba(200, 200, 200, 1.0)";
            font_size = 120;
            font_family = "FiraCode Nerd Font";
            # font_famyly = config.stylix.fonts.serif.name;
            rotate = 0.0;
            shadow_passes = 0;
            shadow_size = 3;
            shadow_color = "rgba(0, 0, 0, 1.0)";
            shadow_boost = 1.2;

            position = "0, 80";
            halign = "center";
            valign = "center";
          }
          {
            monitor = "";
            text = "$LAYOUT";
            color = "rgba(200, 200, 200, 1.0)";
            font_size = 20;
            # font_family = "Iosevka Nerd Font Mono";
            font_famyly = "FiraCode Nerd Font";
            rotate = 0.0;
            shadow_passes = 0;
            shadow_size = 3;
            shadow_color = "rgba(0, 0, 0, 1.0)";
            shadow_boost = 1.2;

            position = "0, -80";
            halign = "center";
            valign = "center";
          }
        ];
      };
    };
  };
}
