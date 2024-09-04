{
  description = "copyright by DenHax";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    devenv.url = "github:cachix/devenv";

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

      systems = [
        linuxArch
        linuxArmArch
        darwinArch
        legacyLinuxArch
        legacyDarwinArch
      ];

      # hosts = import ./hosts.nix { inherit systems; };
      hosts = {
        workstationDH = {
          hostname = "workstation";
          username = "denhax";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isRyzen = true;
          isNvidia = true;
          wm = "qtile";
          de = "";
          cpu = "ryzen";
          gpu = "nvidia";
          isGame = true;
        };
        laptopDH = {
          hostname = "laptop";
          username = "denhax";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isIntel = true;
          wm = "qtile";
          de = "";
          cpu = "intel";
          gpu = "";
          isGame = false;
        };
        serve = {
          hostname = "server";
          username = "dh";
          platform = linuxArch; # ? legacyLinuxArch
          isWorkstation = true;
          isIntel = false;
          isRyzen = false;
          cpu = "";
        };
        raspDH = {
          hostname = "raspberry";
          username = "denhax";
          platform = linuxArmArch; # ? legacyLinuxArch
          isWorkstation = false;
          isIntel = false;
          isRyzen = false;
          cpu = "";
        };
        macXDH = {
          hostname = "macbook";
          username = "denhax";
          platform = darwinArch; # ? legacyDarwinArch
          isWorkstation = true;
          isIntel = false;
          cpu = "";
        };
      };

    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      inherit systems;
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

        templates = import "${self}/template" { inherit self; };

        # homeConfigurations = {
        #
        #   "${hosts.workstationDH.username}@${hosts.workstationDH.hostname}" = confMake.mkHome hosts.workstationDH;
        #   "root@${hosts.workstationDH.hostname}" = confMake.mkHome hosts.workstationDH;
        #
        #   "${hosts.serve.username}@${hosts.serve.hostname}" = confMake.mkHome hosts.serve;
        #   "root@${hosts.serve.hostname}" = confMake.mkHome hosts.serve;
        #
        #   "${hosts.laptopDH.username}@${hosts.laptopDH.hostname}" = confMake.mkHome hosts.laptopDH;
        #   "root@${hosts.laptopDH.hostname}" = confMake.mkHome hosts.laptopDH;
        #
        #   "${hosts.raspDH.username}@${hosts.raspDH.hostname}" = confMake.mkHome hosts.raspDH;
        #   "root@${hosts.raspDH.hostname}" = confMake.mkHome hosts.raspDH;
        #
        #   "${hosts.macXDH.username}@${hosts.macXDH.hostname}" = confMake.mkHome hosts.macXDH;
        # };
      };
    };
}
