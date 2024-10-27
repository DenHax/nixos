{
  lib,
  config,
  username,
  inputs,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.services.pgadmin;

  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.services.pgadmin.enable = mkEnableOption "Enables pgadmin";
    mine.servers.postgresql = {
      authentication = mkOpt str "" "Authentication options";
      dbs = mkOpt (listOf str) [ ] "Databases to ensure are added to the server";
      enable = mkEnableOption "Enable or disable postgresql service";
      pgadmin = {
        enable = mkBoolOpt false "Enable PGAdmin";
        email = mkOpt str config.mine.user.email "Initial admin Email";
        firewall = mkBoolOpt true "Open the firewall?";
        settings = mkOpt attrs {
          "ALLOWED_HOSTS" =
            [
            ];
          "CONFIG_DATABASE_URI" = "postgresql://${config.mine.user.name}:${config.mine.user.name}@localhost/${config.mine.user.name}";
        } "Settings for PGAdmin";
      };
      script = mkOpt (listOf str) "" "Postgres Initial startup script.";
      users = mkOpt (listOf attrs) [ ] "ensureUsers variables";
    };
  };
  config = mkIf cfg.enable {
    networking.firewall.allowedTCPPorts = [ 5050 ];
    services.pgadmin = {
      port = 5050;
      enable = true;
      initialEmail = mkAliasDefinitions options.mine.servers.postgresql.pgadmin.email;
      initialPasswordFile = config.sops.secrets.pg_pass.path;
      openFirewall = mkAliasDefinitions options.mine.servers.postgresql.pgadmin.firewall;
      settings = mkAliasDefinitions options.mine.servers.postgresql.pgadmin.settings;
    };
    users.users.pgadmin = {
      extraGroups = [ config.users.groups.keys.name ];
    };
  };
}
