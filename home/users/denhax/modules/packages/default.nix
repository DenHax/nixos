{
  config,
  lib,
  inputs,
  pkgs,
  isWorkstation,
  isGame,
  hostname,
  # hostname,
  ...
}:

with lib;

let
  inherit (pkgs.stdenv) isLinux;
  cfg = config.module.users.denhax.packages;

  isHardGame = isWorkstation && isGame && hostname == "workstation";
  isSoftGame = isWorkstation && isGame && hostname == "laptop";

  retroarch-pkg = (
    pkgs.retroarch.override {
      cores = with pkgs.libretro; [
        snes9x # SNES
        beetle-psx-hw # PS1
        vba-next # GBA
        ppsspp # PSP
        parallel-n64 # N64
        desmume # DS
        dosbox-pure # DOS
      ];
    }
  );

  texlive-pkg = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium
        xifthen
        ifmtarg
        textpos
        framed
        paralist
        titlesec
        tocloft
        enumitem
        cyrillic
        babel-russian
        minted
        ;
    }
  );

  rstudio_cust = pkgs.rstudioWrapper.override {
    packages = with pkgs.rPackages; [
      ggplot2
      dplyr
      xts
      shiny
      maps
      mapproj
      gapminder
      renv
    ];
  };
in
{
  options.module.users.denhax.packages = {
    enable = mkEnableOption "Enable denhax packages";
  };

  config = mkIf cfg.enable {

    home.packages =
      with pkgs;
      [
        # Cli utils and equiv
        gat
        fd
        duf
        jq
        procs
        tlrc
        pre-commit
        tokei
        zip
        unzip
        pre-commit
        ffmpeg
        wf-recorder

        # Nix and NixOS
        nix-prefetch-scripts
        nix-prefetch-github
        # deadnix
        # statix

        # Development envirements, Devenv and etc.
        devenv

        # Program langs,
        rustc
        nodejs_22
        typescript
        go
        lua
        # python312

        # Build programs, packages managers
        pnpm
        cargo
        gcc
        gnumake

        # Secrets and Security
        age
        grype
        sops
        syft

        # DevOps Utils
        docker-compose
        ansible
        ansible-lint
        # k3s
        kubectl
        kubernetes-helm
        # terraform
      ]
      ++ lib.optionals isWorkstation [
        # discord
        obsidian
        semgrep
        bruno
      ]
      ++ lib.optionals (isLinux && isWorkstation) [
        # DevOps Utils
        # vagrant

        # database
        # dbeaver-bin

        # GUI utils
        gparted
        # modem-manager-gui

        # Filemanagers gui
        nemo

        pcmanfm
        shared-mime-info
        lxde.lxmenu-data

        # Tor 
        rustmission
        transmission_4

        # REmote Desktop
        # rdesktop
        # remmina
        freerdp3

        # IDE
        # rstudio_cust

        # Office
        # onlyoffice-bin
        texlive-pkg
        libreoffice-qt
        hunspell
        hunspellDicts.en_US
        hunspellDicts.ru_RU

        # Misc, Music, Video
        pavucontrol
        musescore
        # obs-studio
        # dconf2nix
        # via
        # vlc

        # Themes and Icons
        gtk-engine-murrine
        kanagawa-gtk-theme
        kanagawa-icon-theme
        orchis-theme
        vimix-cursors
        tela-circle-icon-theme
        linearicons-free
        flat-remix-icon-theme
        papirus-icon-theme
        # gnome-themes-extra

        # Images and pdf viewers, videos
        imv
        mpv
        viu
        nomacs
        # feh
        # swayimg
        # imagemagick
        # oculante

        # Screenshots and recorders
        grim
        slurp
        swappy
        satty

        # UML, SVG, Diagrams, Prototypes, any editors
        akira-unstable
        inkscape-with-extensions
        gimp-with-plugins
        pizarra
        drawio
        # plantuml
        # umlet
        # pencil
        # staruml

        # Utlis
        # swww
        brightnessctl
        # cliphist
        dbus
        libnotify
        glib
        networkmanagerapplet
        xdg-utils

        # Wayland
        wl-clipboard
        wf-recorder
        wlroots
        xwayland

        # Xorg
        # xclip
        # picom
        # dmenu

        # Messenger
        telegram-desktop
      ]
      ++ lib.optionals isHardGame [
        protonup
        lutris
        heroic
        retroarch-pkg
        dolphin-emu
        lime3ds
        # arx-libertatis
      ]
      ++ lib.optionals isSoftGame [
        retroarch-pkg
        dolphin-emu
        # protonup
        # lime3ds
      ];
  };
}
