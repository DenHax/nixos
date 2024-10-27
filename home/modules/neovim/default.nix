{
  pkgs,
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.module.nvim;
in
{
  options = {
    module.nvim.enable = mkEnableOption "Enables neovim";
  };

  config = mkIf cfg.enable {
    home.shellAliases.vv = "NVIM_APPNAME=nvim-dh nvim";
    home.shellAliases.v = "NVIM_APPNAME=nvim-coder nvim";
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

        # Bash
        nodePackages.bash-language-server
        shellcheck
        shfmt

        # Docker & Kubernetes
        docker-ls

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

        # Markdown, Markups langs, TeX
        marksman
        texlab
        ltex-ls

        # Nix
        nil
        nixfmt-rfc-style

        # PHP
        # intelephense
        # php84Packages.php-codesniffer

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

        # Java

        # Kotlin

        # Scala

        # Dart

        # Asm

        # Cobol

        # Dart

        # Objective-c

        # Perl

        # Swift
      ];
    };
    xdg.configFile."nvim-dh" = {
      source = ./DH;
      recursive = true;
    };

    xdg.configFile."nvim-coder" = {
      source = ./NV;
      recursive = true;
    };

    xdg.configFile."nvim-writter" = {
      source = ./VW;
      recursive = true;
    };
  };
}
