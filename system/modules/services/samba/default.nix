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
    services.samba.enable = mkEnableOption "Enables samba";
  };

  config = mkIf cfg.enable {
    services.samba = {
      enable = true;
      # openFirewall = true;
      # shares = {
      # global = {
      #   "invalid users" = [
      #     "root"
      #   ];
      #   "passwd program" = "/run/wrappers/bin/passwd %u";
      #   security = "user";
      # };
      #   public = {
      #     "path" = "/home/${username}/Share/VM/win7";
      #     comment = "Win sharing";
      #     "guest ok" = "yes";
      #     "read only" = false;
      #     "available" = "yes";
      #     "valid users" = "nobody";
      #     browsable = "yes";
      #     "public" = "yes";
      #     "writable" = "yes";
      #   };
      # };
    };
  };
}
