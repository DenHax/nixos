{
  description = "copyright by DenHax";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # nixos-06cb-009a-fingerprint-sensor = {
    #   url = "github:ahbnr/nixos-06cb-009a-fingerprint-sensor";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # devenv.url = "github:cachix/devenv";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence = {
      url = "github:/nix-community/impermanence";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    ags = {
      url = "github:Aylur/ags";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
    };

    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland/v1.3.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    proxmox-nixos = {
      url = "github:SaumonNet/proxmox-nixos";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    stylix.url = "github:danth/stylix";

    wallpaperImage = {
      url = "https://r4.wallpaperflare.com/wallpaper/283/881/127/the-great-wave-off-kanagawa-painting-japanese-waves-wallpaper-0e19ea97218f10d82b15fbcaa3f2b7ee.jpg";
      flake = false;
    };

    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    let

      # stateVersion = "24.11";
      # stateVersionDarwin = 6;
      confMake = import ./lib {
        inherit
          self
          inputs
          # stateVersion
          # stateVersionDarwin
          ;
      };

      linuxArch = "x86_64-linux";
      linuxArmArch = "aarch64-linux";
      darwinArch = "aarch64-darwin";
      legacyLinuxArch = "i686-linux";
      legacyDarwinArch = "x86_64-darwin";

      systems = {
        inherit
          linuxArch
          linuxArmArch
          darwinArch
          legacyLinuxArch
          legacyDarwinArch
          ;
      };

      hosts = import ./hosts.nix { inherit systems; };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      # inherit systems;
      systems = confMake.forAllSystems;
      flake = {
        nixosConfigurations = confMake.genNixOS hosts.nixos;

        darwinConfigurations = confMake.genDarwin hosts.darwin;

        templates = import "${self}/template" { inherit self; };
      };
    };
}
