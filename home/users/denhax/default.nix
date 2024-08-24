{
  isWorkstation,
  username,
  config,
  pkgs,
  ...
}:
let
  inherit (pkgs.stdenv) isLinux;
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

  # stylix.targets = { };

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
    feh.enable = false;
    fish.enable = false;
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
    awesome.enable = false;
    flameshot.enable = false;
    gtk.enable = true;
    hyprland.enable = isLinux && isWorkstation;
    hypridle.enable = config.module.hyprland.enable;
    hyprlock.enable = config.module.hyprland.enable;
    hyprpaper.enable = config.module.hyprland.enable;
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
    lazygit.enable = true;
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
