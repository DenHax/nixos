{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.direnv;
in
{
  options = {
    module.direnv.enable = mkEnableOption "Enables direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      package = pkgs.direnv;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
