{ config, lib, ... }:

with lib;

let
  cfg = config.module.gh-dash;
in
{
  options.module = {
    gh-dash.enable = mkEnableOption "Enable gh dashboard";
  };
  config = mkIf cfg.enable {
    programs.gh-dash = {
      enable = true;
    };
  };
}
