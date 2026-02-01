{ config, pkgs, lib, ... }:

{
  home.file.".local/bin/git-prompt.sh" = {
    text = ''
      #!${pkgs.bash}/bin/bash
      # ambil konfigurasi dari ~/.config/git-prompt.sh
      if [ -f "$HOME/.config/git-prompt.sh" ]; then
        source "$HOME/.config/git-prompt.sh"
      fi
    '';
    executable = true;
  };
}
