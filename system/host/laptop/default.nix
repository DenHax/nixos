{
  wm,
  de,
  isGame,
  ...

}:
let
  isHypr = wm == "hyprland";
  isQtile = wm == "qtile";
  isRiver = wm == "river";
  isGnome = de == "gnome";
in
# isRiver = wm == "river";
{
  imports = [
    ../../modules
    ./bootloader
    ./disko
    # ./gpu
    ./hardware
    ./kernel
    ./network
    # ./powermanagment
    ./sound
  ];

  module = {
    locale.enable = true;
    network.enable = true;
    scanner.enable = true;
    security.enable = true;
    timedate.enable = true;
    users.enable = true;
    variables.enable = true;
    virtualisation.enable = true;
    wireguard.enable = true;

    programs = {
      dconf.enable = false;
      fish.enable = false;
      font.enable = true;
      gnupg.enable = true;
      hm.enable = true;
      kdeconnect.enable = false;
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
      devmon.enable = true;
      fprint.enable = true;
      fwupd.enable = true;
      greetd.enable = true;
      gvfs.enable = true;
      hyprland.enable = isHypr;
      input.enable = false;
      k3s.enable = false;
      kubernetes.enable = false;
      light.enable = true;
      logind.enable = false;
      river.enable = isRiver;
      qtile.enable = isQtile;
      samba.enable = false;
      sddm.enable = false;
      syncthing.enable = false;
      thunderbolt.enable = true;
      tlp.enable = false;
      postgresql.enable = false;
      pgadmin.enable = false;
      pgmanage.enable = false;
      printing.enable = false;
      udisk.enable = true;
    };
  };
}
