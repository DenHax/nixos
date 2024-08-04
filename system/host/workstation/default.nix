{
  imports = [
    ../../modules
    ./disko
    ./gpu
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
      zsh.enable = false;
    };

    services = {
      awesome.enable = false;
      blueman.enable = true;
      auto-cpufreq.enable = false;
      fwupd.enable = true;
      greetd.enable = true;
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
