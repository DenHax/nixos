{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:

with lib;

let
  cfg = config.module.nvim;
  pkgsStable = import inputs.nixpkgs-stable {
    system = pkgs.stdenv.hostPlatform.system;
    config = {
      allowUnfree = true;
    };
  };
in
{
  options = {
    module.nvim.enable = mkEnableOption "Enables neovim";
  };

  config = mkIf cfg.enable {
    home.shellAliases.vv = "NVIM_APPNAME=nvim-dh nvim";
    home.shellAliases.v = "nvim"; # NVIM_APPNAME=nvim-coder
    home.shellAliases.vw = "NVIM_APPNAME=nvim-writter nvim";

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      # plugins = with pkgs.vimPlugins; [ markdown-preview-nvim ];
      extraPackages = with pkgs; [
        # Auxiliary stuff for currect work
        lua51Packages.lua
        lua51Packages.luarocks
        lua51Packages.jsregexp
        tree-sitter
        # luajitPackages.luarocks

        # Language server protocols, linters, formatters
        # Ansible
        ansible-language-server

        # Bash
        nodePackages.bash-language-server
        shellcheck
        shfmt

        # Docker
        docker-compose-language-service
        dockerfile-language-server-nodejs
        # docker-ls

        # Go
        gopls
        gotools
        gomodifytags
        gotests
        impl
        iferr

        # Lua
        lua-language-server
        selene
        stylua

        # Kubernetes
        helm-ls

        # Markdown, Markups langs, TeX
        marksman
        texlab
        ltex-ls

        # Nix
        nixd
        nixfmt-rfc-style
        # nil

        # PHP
        intelephense
        php83Packages.php-codesniffer
        # php83Packages.php-cs-fixer

        # Python
        ruff
        mypy
        pyright
        basedpyright
        black
        isort

        # Rust
        rust-analyzer
        rustfmt

        # Database
        sqls
        sqlfluff

        # web (JS, TS, HTML, CSS)
        typescript-language-server
        emmet-language-server
        prettierd
        eslint_d
        vscode-langservers-extracted
        tailwindcss-language-server

        # YAML
        yaml-language-server
        yamllint
        yamlfmt

        # Asm
        # Cobol
        # Dart
        # Java
        # Kotlin
        # Objective-c
        # Perl
        # Scala
        # Swift
      ];
    };

    nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

    xdg.configFile."nvim-dh" = {
      source = ./DH;
      recursive = true;
    };

    xdg.configFile."nvim" = {
      # -coder
      source = ./NV;
      recursive = true;
    };

    xdg.configFile."nvim-writter" = {
      source = ./VW;
      recursive = true;
    };
  };
}
