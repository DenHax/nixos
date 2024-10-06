{
  config,
  lib,
  username,
  ...
}:

with lib;

let
  cfg = config.module.services.k3s;
in
{
  options.module = {
    services.k3s.enable = mkEnableOption "Enable k3s";
  };
  config = mkIf cfg.enable {
    services.k3s = {
      enable = true;
    };
  };
}
