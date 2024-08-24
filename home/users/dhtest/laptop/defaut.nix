{ inputs, pkgs, ... }:

{
  home = {
    homeDirectory = "/home/dhtxt";
    packages = with pkgs; [
      firefox
      ulauncher
    ];
  };

  imports = [
    ../../../../modules/nix
    ../../../modules/kitty
    # ../../../modules/flameshot
    ../../../modules/fastfetch
    ../../../modules/htop
    ../../../modules/zsh
    ../../../modules/git
  ];
}
