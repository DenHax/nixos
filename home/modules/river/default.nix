{ }
# {
#   config,
#   lib,
#   pkgs,
#   ...
# }:
#
# with lib;
#
# let
#   cfg = config.module.river;
#   flakeDir = "~/nix";
# in
# {
#   options.module = {
#     river.enable = mkEnableOption "Enables river";
#   };
#
#   config = mkIf cfg.enable {
#     wayland.windowManager.river = {
#       enable = true;
#       xwayland = true;
#       # package = pkgs.river;
#       extraConfig = ''
#         riverctl spawn "bash ${flakeDir}/pkg/waystart/auto.sh"
#
#         riverctl map normal Super Return spawn ${pkgs.kitty}/bin/kitty;
#         riverctl map normal Super+Shift M exit
#         riverctl map normal Super R spawn ${pkgs.rofi}/bin/rofi -show drun -show-icons
#         riverctl map normal Super V spawn ${pkgs.cliphist}/bin/cliphist list | ${pkgs.rofi}/bin/rofi -dmenu | ${pkgs.cliphist}/bin/cliphist decode | ${pkgs.wl-clipboard}/bin/wl-copy
#         riverctl map normal Super C spawn ${pkgs.rofi}/bin/rofi -show calc
#         riverctl map normal Super P spawn ${pkgs.systemd}/bin/loginctl lock-session
#         riverctl map normal Super+Shift spawn ${pkgs.systemd}/bin/systemctl poweroff
#
#         riverctl input pointer-1739-0-Synaptics_TM3289-021 tap enabled
#
#         riverctl focus-follows-cursor normal
#       '';
#       extraSessionVariables = {
#         XDG_CURRENT_DESKTOP = "river";
#         XDG_SESSION_DESKTOP = "river";
#         XCURSOR_SIZE = "18";
#       };
#       systemd = {
#         enable = true;
#       };
#     };
#   };
# }
