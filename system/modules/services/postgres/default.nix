{
  lib,
  config,
  ...
}:

with lib;

let
  cfg = config.module.services.postgresql;
in
{
  options = {
    module.services.postgresql.enable = mkEnableOption "Enables postgresql";
  };

  config = mkIf cfg.enable {
    services.postgresql = {
      enable = true;
      settings = {
        port = 5432;
      };
      ensureDatabases = [ "mydatabase" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
    };
  };
}
