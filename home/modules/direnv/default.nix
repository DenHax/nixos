{
  config,
  lib,
  pkgs,
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
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    stdlib = ''
      if [ -f ".env" ]; then
        dotenv
      fi 
    '';
  };
}
