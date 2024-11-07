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
  cfg = config.module.services.pgmanage;

  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.services.pgmanage.enable = mkEnableOption "Enables pgmanage";
  };

  config = mkIf cfg.enable {

    environment.systemPackages = with pkgs; [
      # pgadmin4-desktopmode
      pgmanage
      # pgadmin4
    ];
    services.pgmanage = {
      enable = true;
      port = 8090;
      connections = [
        {
          lib_db = "hostaddr=127.0.0.1 port=5432 dbname=lib-storage sslmode=disable dbuser=admin";
        }
      ];
    };
  };
}
