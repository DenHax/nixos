{
  config,
  lib,
  username,
  ...
}:

with lib;

let
  cfg = config.module.services.samba;
in
{
  options.module = {
    services.sabma.enable = mkEnableOption "Enables samba";
  };

  config = mkIf cfg.enable {
    services.sabma = {
      enable = true;

      settings = {
        win_share = {
          path = "/home/${username}/Share/VM/win7";
          comment = "Win sharing";
          "guest ok" = "yes";
          "read only" = "no";
          available = "yes";
          "valid users" = "nobody";
          browsable = yes;
          public = yes;
          writable = yes;
        };
      };
    };
  };
}
