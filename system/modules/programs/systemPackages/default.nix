{
  lib,
  config,
  pkgs,
  inputs,
  isWorkstation ? false,
  hostname,
  customPkgs,
  # isIntel ? false,
  # isRyzen ? false,
  # isNvidia ? false,
  cpu ? "",
  gpu ? "",
  ...
}:

with lib;

let
  cfg = config.module.programs.systemPackages;
  isNvidia = gpu == "nvidia";
  isAMD = gpu == "amd";
  isIntel = cpu == "intel";
  isRyzen = cpu == "ryzen";

  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.programs.systemPackages.enable = mkEnableOption "Enable System Software";
  };

  config = mkIf cfg.enable {

    environment.systemPackages =
      with pkgs;
      [
        # Nix and NixOS
        home-manager
        nvd
        nix-output-monitor

        # CLI utils
        wget
        curl
        git
        lf
        tree
        file
        zip
        unzip
        killall
        parted
        # cmake
        # light
        # auto-cpufreq

        # Text editors and IDE
        # micro
        vim

        # CLI equivalents

        # Sound
        pavucontrol
        alsa-utils
        # pipewire
        # pulseaudio
        # pamixer

        # Hardware utils
        glxinfo
        pciutils
        usbutils
        # powertop
        lm_sensors
        strace
        ltrace
        lsof
        sysstat
        cpufetch
        sbctl

        # Network
        inetutils
        wireguard-tools
        dig
        nmap
        dnsutils
        iperf3
        mtr
        ipcalc
        cacert
      ]
      ++ lib.optionals isWorkstation [
        # Hardware
        libGL

        # DE: terminal, file manager, display manager, etc
        dmenu
        kitty
        greetd.greetd

        # Hardware utils
        libva-utils
        intel-gpu-tools
        fwupd
        fwupd-efi
      ]
      ++ lib.optionals (isWorkstation && hostname == "laptop") [
        # (import "${customPkgs}/bat_log" { inherit pkgs; })
      ]
      ++ lib.optionals (isIntel == "true") [ microcodeIntel ]
      ++ lib.optionals (isRyzen == "true") [ ]
      ++ lib.optionals (isNvidia == "true") [ ];
    # ++ lib.optionals (isAMD == "true") [ ];
  };
}
