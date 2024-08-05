{ config, lib, ... }:

with lib;

let
  cfg = config.module.ssh;
in
{
  options = {
    module.ssh.enable = mkEnableOption "Enables ssh";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      enable = true;
    };
  };
}
