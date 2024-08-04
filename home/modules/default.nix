{ inputs, ... }:

{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    ../../modules/stylix

    ./ags
    ./alacritty
    ./awesome
    ./dconf
    ./direnv
    ./dunst
    ./eww
    ./eza
    ./fastfetch
    ./fish
    ./firefox
    ./flameshot
    ./fzf
    ./git
    ./gtk
    ./gvfs
    ./helix
    ./htop
    ./hypridle
    ./hyprland
    ./hyprlock
    ./hyprpaper
    ./kitty
    ./micro
    ./neovim
    ./nm-applet
    ./password-store
    ./qt
    ./ripgrep
    ./rofi
    ./starship
    ./swaync
    ./tmux
    ./vim
    ./waybar
    ./xdg
    ./yazi
    ./zathura
    ./zoxide
    ./zsh
  ];
}
