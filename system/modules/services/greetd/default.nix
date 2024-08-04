{
  lib,
  config,
  username,
  inputs,
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
      # settings = rec {
      #   initial_session = {
      #     command = "${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland";
      #     user = username;
      #   };
      #   default_session = initial_session;
      # };

      settings = {
        default_session = {
          user = username;
          command = builtins.concatStringsSep " " [
            "${pkgs.greetd.tuigreet}/bin/tuigreet"
            "--asterisks"
            "--remember"
            "--time"
            "--cmd ${inputs.hyprland.packages.${pkgs.system}.hyprland}/bin/Hyprland"
          ];
        };
      };
    };
  };
}
