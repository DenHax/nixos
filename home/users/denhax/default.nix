{
  pkgs,
  # inputs,
  config,
  isWorkstation,
  ...
}:

let
  inherit (pkgs.stdenv) isLinux;

  texlive-pkg = (
    pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-medium
        xifthen
        ifmtarg
        framed
        paralist
        titlesec
        enumitem
        cyrillic
        babel-russian
        minted
        ;
      # mnhyphn
      # texments
      # pygmentex
      # latex-uni8
      # babel
      # hyperref
      # geometry
      # graphicscache;
    }
  );
in
{
  imports = [
    ../../../system/modules/nix
    ../../modules
    ./variables.nix
  ];

  nixpkgs.overlays = [
    (import ../../../internal/rofi-calc)
    (import ../../../internal/rofi-emoji)
    # (import ../../../internal/rofimofi)
  ];

  stylix.targets = { };

  module = {
    # WM and Notice
    ags.enable = false;
    dconf.enable = isWorkstation;
    dunst.enable = false;
    eww.enable = false;
    waybar.enable = config.module.hyprland.enable;

    # Cli tools, text editors, file managers, terminal emulator, shells and prompt
    alacritty.enable = false;
    direnv.enable = true;
    helix.enable = isWorkstation;
    fish.enable = false;
    kitty.enable = isWorkstation;
    nvim.enable = true;
    micro.enable = false;
    starship.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zsh.enable = true;

    # GUI applications
    zathura.enable = true;
    firefox.enable = isLinux && isWorkstation;

    # WM and  DE
    awesome.enable = false;
    flameshot.enable = false;
    gtk.enable = true;
    hyprland.enable = isLinux && isWorkstation;
    hypridle.enable = config.module.hyprland.enable;
    hyprlock.enable = config.module.hyprland.enable;
    hyprpaper.enable = config.module.hyprland.enable;
    # hyprpaper.enable = false;
    rofi.enable = config.module.hyprland.enable;
    swaync.enable = true;
    qt.enable = true;
    xdg.enable = isLinux && isWorkstation;

    # Cli utils and equivalents
    btop.enable = false;
    eza.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    git.enable = true;
    htop.enable = true;
    neofetch.enable = false;
    password-store.enable = false;
    ripgrep.enable = true;
    ssh.enable = isLinux && isWorkstation;
    zoxide.enable = true;

    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
  };

  home = {
    packages =
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
        # fastfetch
        neofetch
        # bat
        # btop
        # eza
        # ffmpeg
        # gnuplot
        # zsh-z

        # Nix and NixOS
        nix-prefetch-scripts
        nix-prefetch-github
        # deadnix
        # statix

        # Development envirements, Devenv and etc.
        devenv
        # cachix

        # Program langs,
        rustc
        nodejs_22
        typescript
        go
        lua
        python312
        python312Packages.ipython
        # zulu17
        # kotlin

        # Build programs, packages managers
        pnpm
        cargo
        gcc
        gnumake
        # cmake
        # cairo

        # Databases
        sqlite
        # postgresql

        # Secrets and Security
        # pass
        sops
        grype
        syft

        # DevOps Utils
        docker-compose
        ansible
        ansible-lint
        kubectl
        kubernetes-helm
        terraform

        # Git stuff
        # git
        lazygit

      ]
      ++ lib.optionals isWorkstation [
        # discord
        obsidian
        semgrep
      ]
      ++ lib.optionals (isLinux && isWorkstation) [
        # DevOps Utils
        vagrant

        # Backend utils 
        bruno

        # Frontend utils 

        # Mobile utils 
        # Alter
        # vesktop

        # Filemanagers
        # mate.caja
        pcmanfm
        shared-mime-info
        lxde.lxmenu-data

        # Office
        # onlyoffice-bin
        # texlive-pkg
        # libreoffice-qt
        # hunspell
        # hunspellDicts.en_US
        # hunspellDicts.ru_RU
        # biber

        # Menu
        # ulauncher
        # rofi
        # dmenu

        # Misc, Music, Video
        # obs-studio
        # dconf2nix
        # via
        # vlc
        pavucontrol
        musescore

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
        feh
        viu
        nomacs
        imv
        mpv
        # zathura
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
        # plantuml
        # umlet
        # pencil
        # staruml

        # Utlis
        # swww
        brightnessctl
        cliphist
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

        # Text editors
        # zed-editor

        # AI and pilots
        # codeium

        # Terminal emulator
        # warp-terminal
        # xterm
        # alacritty

        # Rofi
        # rofi-screenshot
        # rofi-bluetooth
        # rofi-power-menu
        # rofi-mpd
        # rofi-menugen
        # rofi-pulse-select
        # rofi-vpn
        # rofi-pass
      ]
      ++ lib.optionals (hostname == "workstation") [
        protonup
        lutris
        heroic
      ];
  };
}
