{ systems, ... }:
{
  nixos = {
    workstation = {
      # hostname = "workstation";
      username = "denhax";
      platform = systems.linuxArch; # ? legacyLinuxArch
      isWorkstation = true;
      wm = "qtile";
      de = "";
      cpu = "ryzen";
      gpu = "nvidia";
      isGame = true;
      # isRyzen = true;
      # isNvidia = true;
    };
    laptop = {
      # hostname = "laptop";
      username = "denhax";
      platform = systems.linuxArch; # ? legacyLinuxArch
      isWorkstation = true;
      wm = "hyprland";
      de = "";
      cpu = "intel";
      gpu = "";
      isGame = false;
      # isIntel = true;
    };
    serve = {
      # hostname = "server";
      username = "dh";
      platform = systems.linuxArch; # ? legacyLinuxArch
      isWorkstation = true;
      cpu = "";
      # isIntel = false;
      # isRyzen = false;
    };
    rasp = {
      # hostname = "raspberry";
      username = "denhax";
      platform = systems.linuxArmArch; # ? legacyLinuxArch
      isWorkstation = false;
      cpu = "";
      # isIntel = false;
      # isRyzen = false;
    };
  };
  darwin = {
    macos = {
      hostname = "macbook";
      username = "denhax";
      platform = systems.darwinArch; # ? legacyDarwinArch
      isWorkstation = true;
      cpu = "";
      # isIntel = false;
    };
  };
}
