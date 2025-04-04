{
  lib,
  config,
  pkgs,
  username,
  ...
}:
with lib;

let
  cfg = config.module.users;
in
{
  options = {
    module.users.enable = mkEnableOption "Enables users";
  };
  config = mkIf cfg.enable {
    users = {
      mutableUsers = true;
      users = {
        ${username} = {
          isNormalUser = true;
          shell = pkgs.zsh;
          description = "${username}, Senior HelloWorld-developer (Golang, Rust, JavaScript, TypeScript, Lua, Nix, C, C++, Bash, PowerShell, Java, PHP, Python, R, Kotlin, Latex, Markdown, Norg, HTML, CSS, XML, JSON, SQL)";
          home = "/home/${username}";
          extraGroups = [
            "audio"
            "docker"
            "input"
            "libvirtd"
            "kvm"
            "networkmanager"
            "video"
            "wheel"
            "scanner"
            "lp"
          ];
          packages = [ ];
        };

        root = {
          shell = pkgs.bash;
        };
      };
    };
    # services.getty.autologinUser = "${username}"; # NOTE: autologin
  };
}
