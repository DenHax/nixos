{
  imports = [
    ../../modules
    ./bootloader
    ./disko
    ./fingerprint
    ./hardware
    ./kernel
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
      # gvfs.enable = true;
      hyprland.enable = true;
      input.enable = false;
      light.enable = true;
      logind.enable = false;
      sddm.enable = false;
      syncthing.enable = true;
      thunderbolt.enable = true;
      tlp.enable = false;
    };
  };
}
