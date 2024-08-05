{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.ripgrep;
in
{
  options = {
    module.ripgrep.enable = mkEnableOption "Enables ";
  };

  config = mkIf cfg.enable {
    programs.ripgrep = {
      enable = true;
    };
  };
}
