{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.tmux;
in
{
  options = {
    module.tmux.enable = mkEnableOption "Enables tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      prefix = "C-a";
    };
  };
}
