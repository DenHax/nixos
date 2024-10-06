{
  wm,
  de,
  ...
}:
let
  isHypr = wm == "hyprland";
  isQtile = wm == "qtile";
in
{
  imports = [
    ../../modules
    ./bootloader
    # ./disko
    ./gpu
    ./hardware
    # ./kernel
    ./network
    ./sound
  ];

  module = {
    locale.enable = true;
    network.enable = true;
    security.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    virtualisation.enable = true;

    programs = {
      dconf.enable = true;
      fish.enable = true;
      font.enable = true;
      gnupg.enable = true;
      hm.enable = true;
      kdeconnect.enable = true;
      nh.enable = true;
      steam.enable = true;
      systemPackages.enable = true;
      xdg-portal.enable = true;
      zsh.enable = true;
    };

    services = {
      awesome.enable = false;
      auto-cpufreq.enable = false;
      blueman.enable = true;
      devmon.enable = true;
      fwupd.enable = true;
      greetd.enable = true;
      gvfs.enable = true;
      hyprland.enable = isHypr;
      input.enable = false;
      light.enable = true;
      logind.enable = false;
      qtile.enable = true;
      sddm.enable = false;
      syncthing.enable = false;
      thunderbolt.enable = true;
      tlp.enable = false;
      postgresql.enable = true;
      pgadmin.enable = true;
      udisk.enable = true;
    };
  };
}
