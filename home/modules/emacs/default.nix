{ config, lib, ... }:

with lib;

let
  cfg = config.module.emacs;
in
{
  options.module = {
    emacs.enable = mkEnableOption "Enable emacs";
  };

  config = mkIf cfg.enable {
    programs.emacs = {
      enable = true;
    };
  };
}
