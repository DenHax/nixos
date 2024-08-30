{
  lib,
  config,
  pkgs,
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
      ensureDatabases = [ "testdata" ];
      authentication = pkgs.lib.mkOverride 10 ''
        #type database  DBuser  auth-method
        local all       all     trust
      '';
      enableTCPIP = true;
      # authentication = pkgs.lib.mkOverride 10 ''
      #   #...
      #   #type database DBuser origin-address auth-method
      #   # ipv4
      #   host  all      all     127.0.0.1/32   trust
      #   # ipv6
      #   host all       all     ::1/128        trust
      # '';
    };
  };
}
