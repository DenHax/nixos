{ pkgs, ... }:
{
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
  #     driver = pkgs.pkgs.libfprint-2-tod1-goodix;
  #     # pkgs.libfprint-2-tod1-goodix; # Goodix driver module
  #     # pkgs.libfprint-2-tod1-elan # Elan(04f3:0c4b) driver
  #     # pkgs.libfprint-2-tod1-vfs0090; # driver for 2016 ThinkPads
  #     # pkgs.libfprint-2-tod1-goodix-550a
  #   };
  # };
}
