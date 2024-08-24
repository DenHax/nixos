{
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.programs.steam;
in
{
  options = {
    module.programs.steam.enable = mkEnableOption "Enable steam";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    environment.systemPackages = with pkgs; [ mangohud ];

    programs.gamemode.enable = true;
  };
}
