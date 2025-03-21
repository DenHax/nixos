{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.fzf;
in
{
  options = {
    module.fzf.enable = mkEnableOption "Enables fzf";
  };

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--border"
        "--preview '${pkgs.bat}/bin/bat --color=always {}'"
        "--prompt 'Files> '"
      ];
    };
  };
}
