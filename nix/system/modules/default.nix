{ inputs, ... }:

{
  imports = [
    ../../stylix
    inputs.stylix.nixosModules.stylix
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ./locale
    ./network
    ./nix
    ./programs
    ./security
    ./services
    ./timedate
    ./users
    ./variables
    ./virtualisation
  ];
}
