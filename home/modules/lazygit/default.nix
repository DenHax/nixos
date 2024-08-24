{ config, lib, ... }:

with lib;

let
  cfg = config.module.lazygit;
in
{
  options.module = {
    lazygit.enable = mkEnableOption "Enable lazygit";
  };
  config = mkIf cfg.enable {
    programs.lazygit = {
      enable = true;
    };
  };
}
