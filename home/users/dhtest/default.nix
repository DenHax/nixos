{ pkgs, inputs, ... }:

{
  programs.home-manager.enable = true;

  home = {
    username = "dhtxt";
    stateVersion = "24.05";
    packages = with pkgs; [ ];
  };
}
