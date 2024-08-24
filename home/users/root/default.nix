{ pkgs, inputs, ... }:

{
  home = {
    packages = with pkgs; [ ];
  };

  imports = [
    ../../../modules/nix
    ../../modules
  ];

  module = {
    git.enable = true;
    htop.enable = true;
    fastfetch.enable = true;
    vim.enable = true;
    fish.enable = true;

    nix-config = {
      enable = true;
      useNixPackageManagerConfig = false;
    };
  };
}
