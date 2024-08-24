{ config, lib, ... }:

with lib;

let
  cfg = config.module.lf;
in
{
  options.module = {
    lf.enable = mkEnableOption "Enable lf";
  };

  config = mkIf cfg.enable {
    programs.lf = {
      enable = true;
    };
  };
}
