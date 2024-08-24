{ self, inputs }:
let
  homeConfiguration = "${self}/home";
  systemConfiguration = "${self}/system";

  homeModules = "${homeConfiguration}/modules";
  systemModules = "${systemConfiguration}/modules";
  commonModules = "${self}/modules";
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
      isIntel ? false,
      isRyzen ? false,
      isNvidia ? false,
      isAMD ? false,
    }:
    let
      hostConfigurationPath = "${self}/system/machine/${hostname}";
      hostConfigurationPathExist = builtins.pathExists hostConfigurationPath;
      hostModulesPath = "${self}/system/machine/${hostname}/modules";
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

          isIntel
          isRyzen
          isNvidia
          isAMD

          homeModules
          systemModules
          commonModules
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
          systemModules
          commonModules
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
