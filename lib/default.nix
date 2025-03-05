{ self, inputs }:
let
  homeConfiguration = "${self}/home";
  systemConfiguration = "${self}/system";

  homeModules = "${homeConfiguration}/modules";
  systemModules = "${systemConfiguration}/modules";
  commonModules = "${self}/modules";
  overlayModules = "${self}/internal";
  customPkgs = "${self}/pkg";

  mkHost =
    hostname:
    {
      username ? "denhax",
      stateVersion ? "24.05",
      platform ? "x86_64-linux",
      isWorkstation ? false,
      wm ? null,
      de ? null,
      cpu ? null,
      gpu ? null,
      isGame ? false,
    # isIntel ? false,
    # isRyzen ? false,
    # isNvidia ? false,
    # isAMD ? false,
    }:
    let
      hostConfigurationPath = "${self}/system/host/${hostname}";
      hostConfigurationPathExist = builtins.pathExists hostConfigurationPath;
      hostModulesPath = "${self}/system/host/${hostname}/modules";
      hostModulesPathExist = builtins.pathExists hostModulesPath;
    in
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          self
          inputs
          hostname
          username
          platform
          stateVersion
          isWorkstation
          wm
          de
          isGame

          cpu
          gpu
          # isIntel
          # isRyzen
          # isNvidia
          # isAMD

          homeModules
          systemModules
          commonModules
          overlayModules
          customPkgs
          hostConfigurationPath
          hostConfigurationPathExist
          hostModulesPath
          hostModulesPathExist
          ;
      };

      modules =
        [
          inputs.home-manager.nixosModules.home-manager
          inputs.stylix.nixosModules.stylix
          inputs.disko.nixosModules.disko
          inputs.nur.modules.nixos.default
          inputs.proxmox-nixos.nixosModules.proxmox-ve
          inputs.impermanence.nixosModules.impermanence

          "${systemConfiguration}"
          "${homeConfiguration}"
        ]
        ++ (
          if hostname == "laptop" then
            [
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen
            ]
          else
            [ ]
        );
    };

  mkHostDarwin =
    hostname:
    {
      username ? "denhax",
      stateVersion ? 6,
      platform ? "aarch64-darwin",
      cpu ? "",
    # isIntel ? false,
    }:
    inputs.darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          self
          inputs
          hostname
          username
          platform
          stateVersion

          cpu

          systemModules
          commonModules
          overlayModules
          customPkgs
          ;
      };

      modules = [
        "${systemConfiguration}"
        "${homeConfiguration}"
      ];
    };
in
{
  forAllSystems = inputs.nixpkgs.lib.systems.flakeExposed;

  genNixOS = builtins.mapAttrs mkHost;

  genDarwin = builtins.mapAttrs mkHostDarwin;

  #   "aarch64-linux"
  #   "x86_64-linux"
  #   "aarch64-darwin"
  #
  #   # Legacy
  #   "i686-linux"
  #   "x86_64-darwin"
}
