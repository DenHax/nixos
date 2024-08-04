{
  pkgs,
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.awesome;
in
{
  options = {
    module.services.awesome.enable = mkEnableOption "Enable awesome";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.awesome = {
      enable = false;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };
}
