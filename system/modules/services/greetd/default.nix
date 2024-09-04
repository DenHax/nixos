{
  lib,
  config,
  inputs,
  username,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.services.greetd;
in
{
  options = {
    module.services.greetd.enable = mkEnableOption "Enable greetd";
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      package = pkgs.greetd.tuigreetd;
      settings = {
        default_session = {
          user = username;
          # command = "${pkgs.hyprland}/bin/Hyprland";
          command = "${pkgs.qtile-unwrapped}/bin/qtile start -b wayland";
        };
        initial_session = {
          # command = "${pkgs.hyprland}/bin/Hyprland";
          command = "${pkgs.qtile-unwrapped}/bin/qtile start -b wayland";
          user = username;
        };
      };
    };
  };
}
