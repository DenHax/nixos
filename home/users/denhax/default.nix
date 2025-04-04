{
  isWorkstation ? false,
  username,
  config,
  pkgs,
  wm,
  de,
  ...
}:
let
  inherit (pkgs.stdenv) isLinux;
  isAwesome = wm == "awesome";
  isDE = de != "" || wm != null;
  isHypr = wm == "hyprland";
  isSway = wm == "sway";
  isRiver = wm == "river";
  isWM = wm != null || wm != "";
in

{
  imports = [
    # ../../../system/modules/nix
    # ../../modules
    ./variables.nix
  ];

  nixpkgs.overlays = [
    (import ../../../internal/rofi-calc)
    (import ../../../internal/rofi-emoji)
    # (import ../../../internal/rofimofi)
  ];

  # stylix.targets = { };

  module = {
    # WM and Notice
    ags.enable = false;
    dconf.enable = isWorkstation;
    dunst.enable = isWM && false;
    eww.enable = isWM && false;
    network-manager-applet.enable = true;
    waybar.enable = isWM;

    # Cli tools, text editors, file managers, terminal emulator, shells and prompt
    alacritty.enable = config.module.kitty.enable == false;
    direnv.enable = true;
    helix.enable = false;
    feh.enable = false;
    fish.enable = false;
    emacs.enable = false;
    kitty.enable = isWorkstation;
    lf.enable = true;
    nvim.enable = true;
    micro.enable = false;
    ranger.enable = false;
    starship.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    zsh.enable = true;

    # GUI applications
    firefox.enable = isLinux && isWorkstation;
    librewolf.enable = isLinux && isWorkstation;
    thunderbird.enable = isWorkstation;
    zathura.enable = isWorkstation;

    # WM and  DE
    awesome.enable = isAwesome;
    flameshot.enable = isWM && false;
    gtk.enable = true;
    hyprland.enable = isHypr;
    hypridle.enable = isWM;
    hyprlock.enable = true;
    # river.enable = isRiver;
    rofi.enable = isWM;
    qt.enable = true;
    sway.enable = isSway;
    swaylock.enable = isSway;
    swaync.enable = isWM;
    vscode.enable = isWorkstation;
    xdg.enable = isLinux && isWorkstation;

    # Cli utils and equivalents
    btop.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    git.enable = true;
    gh.enable = true;
    gh-dash.enable = true;
    htop.enable = true;
    lazygit.enable = config.module.git.enable;
    neofetch.enable = false;
    password-store.enable = true;
    ripgrep.enable = true;
    ssh.enable = isLinux && isWorkstation;
    zoxide.enable = true;

    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
    users.${username} = {
      packages.enable = true;
      aliases.enable = true;
    };
  };
}
