{ config, lib, ... }:

with lib;

let
  cfg = config.module.gh;
in
{
  options.module = {
    gh.enable = mkEnableOption "Enable gh cli";
  };
  config = mkIf cfg.enable {
    programs.gh = {
      enable = true;
      settings = {
        editor = "nvim";
      };
    };
  };
}
