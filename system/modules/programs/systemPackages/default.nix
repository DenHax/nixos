{
  pkgs,
  lib,
  config,
  isWorkstation ? false,
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
        ranger
        tree
        file
        zip
        unzip
        killall
        # light
        # auto-cpufreq

        # Text editors and IDE
        # micro
        vim
        pkgsStable.wlroots

        # CLI equivalents

        # DE: terminal, file manager, display manager, etc
        dmenu
        kitty
        greetd.greetd

        # Sound
        # pipewire
        # pulseaudio
        # pamixer
        pavucontrol
        alsa-utils

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

        # Hardware utils
        libva-utils
        intel-gpu-tools
        fwupd
        fwupd-efi

        # Utils
        # gnome.dconf-editor
        grim
      ]
      ++ lib.optionals (isIntel == "true") [ microcodeIntel ]
      ++ lib.optionals (isRyzen == "true") [ ]
      ++ lib.optionals (isNvidia == "true") [ ];
    # ++ lib.optionals (isAMD == "true") [ ];
  };
}
