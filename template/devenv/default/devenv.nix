{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  env.GREET = "devenv";

  packages = [ pkgs.git ];

  scripts.hello.exec = '''';

  enterShell = '''';

  enterTest = '''';
}
