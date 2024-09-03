{ inputs, ... }:
(final: prev: {
  inherit (inputs.unstable-small-pkgs) xdg-desktop-portal-hyprland;
})
