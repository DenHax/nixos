{
  pkgs ? import <nixpkgs> { },
}:

let
  coderPackages = with pkgs; [
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

    # JSON

    # Lua
    lua-language-server
    selene
    stylua

    # Kubernetes
    helm-ls

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

  writterPackages = with pkgs; [
    # Markdown, Markups langs, TeX
    marksman
    texlab
    ltex-ls

  ];

  fastPackages = [
    pkgs.nerdtree
    pkgs.fzf
  ];

  # Создаем деривации для каждой сборки
  coderEnv = pkgs.mkShell {
    buildInputs = coderPackages;
  };

  writterEnv = pkgs.mkShell {
    buildInputs = writterPackages;
  };

  fastEnv = pkgs.mkShell {
    buildInputs = fastPackages;
  };
in
{
  coderEnv = coderEnv;
  fastEnv = fastEnv;
  writterEnv = writterEnv;
}
