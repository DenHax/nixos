{
  systemModules,
  lib,
  inputs,
  ...
}:

{
  # Read all directories from systemModules
  imports =
    # [
    #   ../../stylix
    #   inputs.stylix.nixosModules.stylix
    #   inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-6th-gen
    # ] ++
    builtins.filter (module: lib.pathIsDirectory module) (
      map (module: "${systemModules}/${module}") (builtins.attrNames (builtins.readDir systemModules))
    );
}
