{
  systemModules,
  lib,
  ...
}:

let
  hostProgramModulesPath = "${systemModules}/programs";
in
{
  imports = builtins.filter (module: lib.pathIsDirectory module) (
    map (module: "${hostProgramModulesPath}/${module}") (
      builtins.attrNames (builtins.readDir hostProgramModulesPath)
    )
  );
}
