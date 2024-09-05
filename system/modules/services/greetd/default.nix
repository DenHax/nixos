{
  lib,
  config,
  username,
  inputs,
  pkgs,
  wm,
  de,
  ...
}:

with lib;

let
  cfg = config.module.services.greetd;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
  cmd =
    if wm == "hyprland" then
      "${pkgsStable.hyprland}/bin/Hyprland"
    else if wm == "qtile" then
      "${pkgs.qtile-unwrapped}/bin/qtile start -b wayland"
    else if isRiver then
      "${pkgs.river}/bin/river"
    else
      "";
in
{
  options.module = {
    services.greetd.enable = mkEnableOption "Enable greetd";
  };

  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      package = pkgs.greetd.tuigreetd;
      settings = {
        default_session = {
          user = username;
          command = cmd;
        };
        initial_session = {
          command = cmd;
          user = username;

          # command = "${pkgs.hyprland}/bin/Hyprland";
          # command = "${pkgs.qtile-unwrapped}/bin/qtile start -b wayland";
        };
      };
    };
  };
}
