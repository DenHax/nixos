{
  wm,
  de,
  ...
}:
let
  isHypr = wm == "hyprland";
  isQtile = wm == "qtile";
  isRiver = wm == "river";
in
# isRiver = wm == "river";
{
  imports = [
    ../../modules
    ./bootloader
    ./disko
    ./fingerprint
    ./hardware
    ./kernel
    ./network
    # ./powermanagment
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
      dconf.enable = false;
      fish.enable = true;
      font.enable = true;
      gnupg.enable = true;
      hm.enable = true;
      kdeconnect.enable = true;
      nh.enable = true;
      steam.enable = false;
      systemPackages.enable = true;
      xdg-portal.enable = true;
      zsh.enable = true;
    };

    services = {
      awesome.enable = false;
      auto-cpufreq.enable = true;
      blueman.enable = true;
      fwupd.enable = true;
      greetd.enable = true;
      gvfs.enable = true;
      hyprland.enable = isHypr;
      input.enable = false;
      k3s.enable = true;
      light.enable = true;
      logind.enable = false;
      river.enable = isRiver;
      qtile.enable = isQtile;
      sddm.enable = false;
      syncthing.enable = false;
      thunderbolt.enable = true;
      tlp.enable = false;
      postgresql.enable = false;
      pgadmin.enable = false;
    };
  };
}
