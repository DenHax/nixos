{ systems, ... }:
{
  workstationDH = {
    hostname = "workstation";
    username = "denhax";
    platform = systems.linuxArch; # ? legacyLinuxArch
    isWorkstation = true;
    isRyzen = true;
    isNvidia = true;
    wm = "qtile";
    de = "";
    cpu = "ryzen";
    gpu = "nvidia";
    isGame = true;
  };
  laptopDH = {
    hostname = "laptop";
    username = "denhax";
    platform = systems.linuxArch; # ? legacyLinuxArch
    isWorkstation = true;
    isIntel = true;
    wm = "qtile";
    de = "";
    cpu = "intel";
    gpu = "";
    isGame = false;
  };
  serve = {
    hostname = "server";
    username = "dh";
    platform = systems.linuxArch; # ? legacyLinuxArch
    isWorkstation = true;
    isIntel = false;
    isRyzen = false;
    cpu = "";
  };
  raspDH = {
    hostname = "raspberry";
    username = "denhax";
    platform = systems.linuxArmArch; # ? legacyLinuxArch
    isWorkstation = false;
    isIntel = false;
    isRyzen = false;
    cpu = "";
  };
  macXDH = {
    hostname = "macbook";
    username = "denhax";
    platform = systems.darwinArch; # ? legacyDarwinArch
    isWorkstation = true;
    isIntel = false;
    cpu = "";
  };
}
