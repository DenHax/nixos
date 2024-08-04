{
  inputs,
  stateVersion,
  stateVersionDarwin,
}:
{
  mkHome =
    {
      username ? "denhax",
      hostname ? "nixos",
      platform ? "x86_64-linux",
      isWorkstation ? false,
      isIntel ? false,
      isRyzen ? false,
      isNvidia ? false,
      isAMD ? false,
    }:
    {
      inputs.home-manager.lib.homeManagerConfiguraion = {
        pkgs = inputs.nixpkgs.legacyPackages.${platform};
        extraSpecialArgs = {
          inherit
            inputs
            platform
            username
            hostname
            stateVersion
            isWorkstation
            isIntel
            isRyzen
            isNvidia
            isAMD
            ;
        };
        modules = [ "../home" ];
      };
    };

  mkHost =
    {
      hostname ? "nixos",
      username ? "denhax",
      platform ? "x86_64-linux",
      isWorkstation ? false,
      isIntel ? false,
      isRyzen ? false,
      isNvidia ? false,
      isAMD ? false,
    }:
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
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
          ;
      };

      modules =
        [ ../system ]
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
      platform ? "aarch64-darwin",
      isIntel ? false,
    }:
    inputs.darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          inputs
          hostname
          platform
          stateVersionDarwin
          isIntel
          ;
      };

      modules = [ ../system ];
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
