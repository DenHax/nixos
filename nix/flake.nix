{
  description = "copyright by DenHax";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1&ref=refs/tags/v0.41.1";
    };

    xdghypr = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland/v1.3.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { flake-parts, ... }@inputs:
    let
      linuxArch = "x86_64-linux";
      linuxArmArch = "aarch64-linux";
      darwinArch = "aarch64-darwin";
      legacyLinuxArch = "i686-linux";
      legacyDarwinArch = "x86_64-darwin";

      stateVersion = "24.11";
      stateVersionDarwin = 4;
      confMake = import ./lib { inherit inputs stateVersion stateVersionDarwin; };
      hosts = {
        workstationDH = {
          hostname = "workstation";
          username = "denhax";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isRyzen = true;
          isNvidia = true;
        };
        laptopDH = {
          hostname = "laptop";
          username = "denhax";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isIntel = true;
        };
        serve = {
          hostname = "server";
          username = "dh";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isIntel = false;
          isRyzen = false;
        };
        raspDH = {
          hostname = "raspberry";
          username = "denhax";
          platform = linuxArmArch; # ? legacyLinuxArch
          isWorkstation = false;
          isIntel = false;
          isRyzen = false;
        };
        macXDH = {
          hostname = "macbook";
          username = "denhax";
          platform = darwinArch; # ? legacyDarwinArch
          isWorkstation = true;
          isIntel = false;
        };
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        linuxArch
        linuxArmArch
        darwinArch
        legacyLinuxArch
        legacyDarwinArch
      ];
      flake = {
        nixosConfigurations = {
          ${hosts.workstationDH.hostname} = confMake.mkHost hosts.workstationDH;
          ${hosts.serve.hostname} = confMake.mkHost hosts.serve;
          ${hosts.laptopDH.hostname} = confMake.mkHost hosts.laptopDH;
          ${hosts.raspDH.hostname} = confMake.mkHost hosts.raspDH;
          ${hosts.macXDH.hostname} = confMake.mkHost hosts.macXDH;
        };

        darwinConfigurations = {
          ${hosts.macbox.hostname} = confMake.mkHostDarwin hosts.macbox;
        };

        homeConfigurations = {

          "${hosts.workstationDH.username}@${hosts.workstationDH.hostname}" = confMake.mkHome hosts.workstationDH;
          "root@${hosts.workstationDH.hostname}" = confMake.mkHome hosts.workstationDH;

          "${hosts.serve.username}@${hosts.serve.hostname}" = confMake.mkHome hosts.serve;
          "root@${hosts.serve.hostname}" = confMake.mkHome hosts.serve;

          "${hosts.laptopDH.username}@${hosts.laptopDH.hostname}" = confMake.mkHome hosts.laptopDH;
          "root@${hosts.laptopDH.hostname}" = confMake.mkHome hosts.laptopDH;

          "${hosts.raspDH.username}@${hosts.raspDH.hostname}" = confMake.mkHome hosts.raspDH;
          "root@${hosts.raspDH.hostname}" = confMake.mkHome hosts.raspDH;

          "${hosts.macXDH.username}@${hosts.macXDH.hostname}" = confMake.mkHome hosts.macXDH;
        };
      };
    };
}
