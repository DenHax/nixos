{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.services.fprint;
in
{
  options.module = {
    services.fprint.enable = mkEnableOption "Enables fprint";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      open-fprintd
      fprintd
      # libfprint
    ];

    services.fprintd.enable = true;

    security.pam.services = {
      sudo.fprintAuth = true;
      # login.fprintAuth = true;
      # xscreensaver.fprintAuth = true;
    };
    # services.open-fprintd.enable = true;
    # services.python-validity.enable = true;

    # systemd.services.fprintd = {
    #   wantedBy = [ "multi-user.target" ];
    #   serviceConfig.Type = "simple";
    # };

    # services.fprintd = {
    #   enable = true;
    #   tod = {
    #     enable = true;
    # driver = pkgs.pkgs.libfprint-2-tod1-goodix;
    # pkgs.libfprint-2-tod1-goodix; # Goodix driver module
    # pkgs.libfprint-2-tod1-elan # Elan(04f3:0c4b) driver
    # pkgs.libfprint-2-tod1-vfs0090; # driver for 2016 ThinkPads
    # pkgs.libfprint-2-tod1-goodix-550a
    #   };
    # };
  };
}
