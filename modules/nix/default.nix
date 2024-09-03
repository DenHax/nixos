{
  inputs,
  self,
  lib,
  config,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.module.nix-config;
  inherit (pkgs.stdenv) isLinux;
in
{
  options = {
    module.nix-config = {
      enable = mkEnableOption "Enables nix-config";

      useNixPackageManagerConfig = mkOption {
        type = types.bool;
        description = "Custom Nix package manager";
        default = true;
      };
    };
  };

  config = mkIf cfg.enable {
    nixpkgs.config = {
      allowUnfree = true;
    };

    nix = optionalAttrs cfg.useNixPackageManagerConfig ({

      gc = mkIf (!config.module.porgrams.nh.enable) {
        automatic = true;
        options = "--delete-older-than 30d";
      };

      extraOptions = ''
        trusted-users = root denhax
      '';
      registry.s.flake = self;

      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        # auto-optimise-store = true;
        substituters = [ "https://hyprland.cachix.org" ];
        trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      };

    }
    # // optionalAttrs isLinux {
    #   gc.dates = "weekly";
    #   optimise.automatic = true;
    # }
    );
  };
}
