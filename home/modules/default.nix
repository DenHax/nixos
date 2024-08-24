{ homeModules, lib, ... }:

{
  # Read all directories from homeModules
  imports =
    # [
    #   # inputs.stylix.homeManagerModules.stylix
    #   ../../stylix
    #
    # ] ++
    builtins.filter (module: lib.pathIsDirectory module) (
      map (module: "${homeModules}/${module}") (builtins.attrNames (builtins.readDir homeModules))
    );
}
