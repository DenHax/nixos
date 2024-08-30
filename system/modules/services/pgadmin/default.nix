{
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.pgadmin;
in
{
  options = {
    module.services.pgadmin.enable = mkEnableOption "Enables pgadmin";
  };

  config = mkIf cfg.enable {
    services.pgadmin = {
      enable = true;

    };
  };
}
