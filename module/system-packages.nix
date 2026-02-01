{ config, lib, pkgs, ... }:

{ 
   environment.systemPackages = (with pkgs; [
      # BSPWM Stuff
      polybarFull
      sxhkd
      picom
      eww
 
      cachix
      ripgrep
      wget
      btop
      tree
      bat
 
      killall
      xclip
      dpkg
      unzip
      imlib2
      xorg.xinit
      xorg.xsetroot
      xorg.xrandr
      xorg.xinput

      brightnessctl
      libcanberra-gtk3
      sound-theme-freedesktop
      pamixer
      xdotool
      xarchiver
      mpv
      acpi
      dunst
      # AUDIO
   ])
    ++ (with pkgs.unstable; [
      # unstable packages
      python3
      git
      
      # ======= LSP
#      python313Packages.python-lsp-server # (or ty/ruff) python
      typescript-language-server # javascript, typescript..
#      jdt-language-server # Java
      vscode-json-languageserver # json
#      vscode-css-languageserver # css
#      superhtml # html
      rust-analyzer # Rust
#      marksman # .md/markdown
      nixd # nix language
      taplo # toml
#      yaml-language-server # yaml
    ]);
}
