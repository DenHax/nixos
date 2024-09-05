{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.river;
in
{
  options.module = {
    river.enable = mkEnableOption "Enable river";
  };
  config = mkIf cfg.enable {
    wayland.windowManager.river = {
      enable = true;
      xwayland = true;
      extraConfig = ''
        riverctl map normal Super Return spawn ${pkgs.kitty}/bin/kitty;
        riverctl map normal Super+Shift M exit
        riverctl map normal Super R spawn ${pkgs.rofi}/bin/rofi -show drun -show-icons
        riverctl map normal Super V spawn ${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy
        riverctl map normal Super C spawn ${pkgs.rofi}/bin/rofi -show calc
        riverctl map normal Super P spawn ${pkgs.systemd}/bin/liginctl lock-session
        riverctl map normal Super+Shift spawn ${pkgs.systemd}/bin/systemctl poweroff
      '';
      extraSessionVariables = {
        XDG_CURRENT_DESKTOP = "river";
        XDG_SESSION_DESKTOP = "river";
        XCURSOR_SIZE = "18";
      };
    };
  };
}
