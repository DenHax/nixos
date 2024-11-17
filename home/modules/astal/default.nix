{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.astal;
in
{
  options.module = {
    astal.enable = mkEnableOption "Enable astal";
  };

  config = mkIf cfg.enable {
    home.packages = [
      inputs.astal.packages.${pkgs.system}.astal3
      inputs.astal.packages.${pkgs.system}.io
      inputs.astal.packages.${pkgs.system}.asztal
      inputs.astal.packages.${pkgs.system}.screenrecord
    ];
  };
}
