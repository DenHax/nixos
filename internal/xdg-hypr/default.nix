{ inputs, pkgs }:
let
  unstable-small-pkgs = import inputs.nixos-unstable-small { system = pkgs.system; };
in
(final: prev: {
  inherit (unstable-small-pkgs) xdg-desktop-portal-hyprland;
})
