{ pkgs, inputs, ... }:

{
  home = {
    packages = with pkgs; [ ];
  };

  imports = [
    ../../../system/modules/nix
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
