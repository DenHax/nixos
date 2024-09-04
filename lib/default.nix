{ self, inputs }:
let
  homeConfiguration = "${self}/home";
  systemConfiguration = "${self}/system";

  homeModules = "${homeConfiguration}/modules";
  systemModules = "${systemConfiguration}/modules";
  commonModules = "${self}/modules";
  overlayModules = "${self}/internal";
  customPkgs = "${self}/pkg";
in
{
  # Move to #/home/default.nix
  # mkHome =
  #   {
  #     username ? "denhax",
  #     hostname ? "nixos",
  #     platform ? "x86_64-linux",
  #     isWorkstation ? false,
  #     isIntel ? false,
  #     isRyzen ? false,
  #     isNvidia ? false,
  #     isAMD ? false,
  #   }:
  #   inputs.home-manager.lib.homeManagerConfiguration {
  #     pkgs = inputs.nixpkgs.legacyPackages.${platform};
  #     extraSpecialArgs = {
  #       inherit
  #         inputs
  #         platform
  #         username
  #         hostname
  #         stateVersion
  #         self
  #         isWorkstation
  #         isIntel
  #         isRyzen
  #         isNvidia
  #         isAMD
  #         ;
  #     };
  #     modules = [ ../home ];
  #   };

  mkHost =
    {
      hostname ? "nixos",
      username ? "denhax",
      stateVersion ? "24.05",
      platform ? "x86_64-linux",
      isWorkstation ? false,
      wm ? "",
      de ? "",
      cpu ? "",
      gpu ? "",
      isIntel ? false,
      isRyzen ? false,
      isNvidia ? false,
      isAMD ? false,
      isGame ? false,
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
          isIntel
          isRyzen
          isNvidia
          isAMD

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

          "${systemConfiguration}"
          "${homeConfiguration}"
        ]
        ++ (
          if hostname == "laptop" then
            [ inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen ]
          else
            [ ]
        );
    };

  mkHostDarwin =
    {
      hostname ? "macos",
      username ? "denhax",
      stateVersion ? 6,
      platform ? "aarch64-darwin",
      isIntel ? false,
      cpu ? "",
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

          isIntel
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

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "x86_64-linux"
    "aarch64-darwin"

    # Legacy
    "i686-linux"
    "x86_64-darwin"
  ];
}
