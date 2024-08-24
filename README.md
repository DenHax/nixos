# Nix config: NixOS & Home Manager

## Get start:
```bash
git clone git@github.com:DenHax/nixos.git nix
cd nix
sudo nixos-rebuild switch --flake ./#
home-manager switch --flake ./#@
```

## Package that install _without_ Nix or buildFrom:

- Vite:

```bash
npm create vite@lattest # auto
npm install vite
npm uninstall vite
```

- Codeium ls link in Neovim:

```bash
ln -s "$(which codeium_language_server)" /home/denhax/.cache/nvim/codeuim/bin/1.8.80/language_server_linux_x64
```

Link for gtk3 for gtk4 in .config/gtk$(..)
