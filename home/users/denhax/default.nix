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
  isHypr = wm == "hyprland";
  isQtile = wm == "qtile";
  isAwesome = wm == "awesome";
  isWM = wm != "" || wm != null;
  isDE = de != "" || wm != null;
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
    ags.enable = isWM && false;
    dconf.enable = isWorkstation;
    dunst.enable = isWM && false;
    eww.enable = isWM && false;
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
    zathura.enable = true;
    firefox.enable = isLinux && isWorkstation;

    # WM and  DE
    awesome.enable = isAwesome;
    flameshot.enable = isWM && false;
    gtk.enable = true;
    hyprland.enable = false;
    hypridle.enable = isHypr;
    hyprlock.enable = isHypr;
    # hypridle.enable = isWM;
    # hyprlock.enable = config.module.hyprland.enable;
    rofi.enable = isWM;
    swaync.enable = isWM;
    qt.enable = true;
    xdg.enable = isLinux && isWorkstation;

    # Cli utils and equivalents
    btop.enable = false;
    eza.enable = true;
    fastfetch.enable = true;
    fzf.enable = true;
    git.enable = true;
    htop.enable = true;
    lazygit.enable = config.module.git.enable;
    neofetch.enable = false;
    password-store.enable = false;
    ripgrep.enable = true;
    ssh.enable = isLinux && isWorkstation;
    zoxide.enable = true;

    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
    users.${username}.packages.enable = true;
  };
}
