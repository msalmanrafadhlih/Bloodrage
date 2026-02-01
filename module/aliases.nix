# ./aliases.nix
{
  tquilla = "colorscript -r";
  NIXOS = "ls ~/.repos/nixos && cd ~/.repos/nixos";
  RUNNING = "systemctl --user list-units --state=running";
  SYSRUNNING = "systemctl list-units --state=running";
  USAGELOG = "sudo journalctl --disk-usage";
  SYSTEMD = "systemctl list-unit-files --type=service";
  PYTHON8080 = "python3 -m http.server 8080";
  SYSAPPS = "thunar /run/current-system/sw/share/applications";
  TV = "nix run nixpkgs#television";

  ##  SYSTEM CONFIGURATIONS
  HOSTS = "cd ~/.repos/nixos/host && tree ~/.repos/nixos/host";
  NIX = "hx ~/.repos/nixos/system/configuration.nix";
  HNIX = "bat ~/.repos/nixos/system/hardware-configuration.nix";
  FLAKE = "hx ~/.repos/nixos/flake.nix";
  LOCK = "bat ~/.repos/nixos/flake.lock";

  FONTS = "hx ~/.repos/nixos/module/fonts.nix";
  SYSINSTALL = "hx  ~/.repos/nixos/module/system-packages.nix";
  SERVICE = "hx  ~/.repos/nixos/module/services.nix";
  BOOT = "~/.repos/nixos/module/boot.nix";

  ## GIT INTEG?RATION
  GIT = "git add . && git commit -m";
  CLASS = "xprop | grep CLASS";
  NAME = "xprop | grep NAME";
  GRAPH = "git log --oneline --decorate --graph --all";

  ##  USER CONFIGURATIONS {EDIT}
  MDL = "cd ~/.repos/nixos/module && ls -a";
  HOME = "cd ~/.repos/nixos/user && hx ~/.repos/nixos/user/$USER.nix ";
  ALIAS = "hx ~/.repos/nixos/module/aliases.nix";
  BASH = "hx ~/.repos/nixos/module/bash.nix";
  ZSH = " hx ~/.repos/nixos/module/zshrc.nix";
  INSTALL = "hx ~/.repos/nixos/module/packages.nix";
  BAT = "hx ~/.repos/nixos/module/bat.nix";
  XSESSION = "hx ~/.repos/nixos/module/xsession.nix";
  PAD = "hx ~/.repos/nixos/module/touchpad.nix";
  VOL = "hx ~/.repos/nixos/module/volume.nix";
  BRIGHT = "hx ~/.repos/nixos/module/brightness.nix";
  BAT0 = "hx ~/.repos/nixos/module/battery.nix";
  NANO = "hx ~/.repos/nixos/module/nanorc.nix";
  MPD = "hx ~/.repos/nixos/module/mpd.nix";
  BRANCH = "hx ~/.repos/nixos/module/git-prompt.nix";
  TAR = "hx ~/.repos/nixos/module/tar.nix";
  BG = "hx ~/.repos/nixos/module/background.nix";
  OPENCAM = "hx ~/.repos/nixos/module/opencam.nix";
  BOOKMARK = "hx ~/.repos/nixos/module/bookmarks.nix";
  REPOS = "hx ~/.repos/nixos/module/github-repos.nix";
  TMUXSESSION = "hx ~/.repos/nixos/module/tmux-sessions.nix";
  LOCAL = "hx ~/.repos/nixos/module/locals.nix";
  SSH = "hx ~/.repos/nixos/module/ssh.nix";

  ##  USER CONFIGURATIONS {SAVE}
  UTILS = "chmod +x ~/.local/bin/*.sh";

  ## LINK BOOKMARKS
  PERSONAL = "hx ~/.config/bookmarks/personal.txt";
  WORK = "hx ~/.config/bookmarks/work.txt";

  ##  DOTSFILE CONNFIGURATION & BSPWM
  CONFIG = "ls ~/.repos/dots/BSPWM/config && cd ~/.repos/dots/BSPWM/config";
  POLYMODULE = "tree ~/.repos/dots/BSPWM/config/polybar/modules && cd ~/.repos/dots/BSPWM/config/polybar/modules";
  POLYSCRIPT = "cd ~/.repos/dots/BSPWM/config/polybar/script && tree";

  TMUX = "hx ~/.repos/dots/BSPWM/config/tmux/tmux.conf";
  ER = "hx ~/.repos/dots/BSPWM/config/bspwm/src/ExternalRules";
  BSPWM = "hx ~/.repos/dots/BSPWM/config/bspwm/bspwmrc";
  SXHKD = "hx ~/.repos/dots/BSPWM/config/sxhkd/sxhkdrc";
  POLY = "hx ~/.repos/dots/BSPWM/config/polybar/config.ini";
  ALAC = "hx ~/.repos/dots/BSPWM/config/alacritty/alacritty.toml";
  DUNST = "hx ~/.repos/dots/BSPWM/config/dunst/dunstrc";
  CURSOR = "hx ~/.icons/default/index.theme";
  PCOM = "hx ~/.repos/dots/BSPWM/config/picom/picom.conf";
  ANIMA = "hx ~/.repos/dots/BSPWM/config/picom/picom-animations.conf";
  POWERMENU = "hx ~/.repos/dots/BSPWM/config/rofi/files/powermenu/type-4/style-1.rasi";
  ROFI = "hx ~/.repos/dots/BSPWM/config/rofi/files/launchers/type-7/style-4.rasi";

  ## Suckless Stuff
  SUCKPULL = "mv config.h config.h.bak && git pull";
  NSHELL = "cd shell && nix-shell && cd ..";
  PATCH = "patch -p1 <";
  STCONF = "cd ~/.config/st && hx config.h";
  DMENUCONF = "cd ~/.config/dmenu && hx config.h";
  DWMCONF = "cd ~/.config/dwm && hx config.h";
  CONFSAVE = "mv config.h config.h.bak";
  CONFDEL = "cp config.h.bak config.h";
  MAKE = "make clean && make && make install PREFIX=$HOME/.local";
  SUCKLESS = "hx ~/.repos/nixos/module/suckless.nix";

  ## Tmux
  TMUXSAVE = "tmux source-file ~/.config/tmux/tmux.conf";
  TMUXDEL = "tmux kill-server";
  MOSH = "mosh --ssh='ssh -p 8022'";

  # Python
  py = "python3";

  ##  OTHER
  BASHSAVE = "source ~/.bashrc && dunstify 'BASHRC saved'";
  ZSHSAVE = "source ~/.zshrc && dunstify 'ZSHRC saved'";
  UPDT = "nix flake update";
  SAVEFLAKE = "sudo nixos-rebuild switch --flake ~/.repos/nixos#nixos";

  OLD = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
  GBGOLD = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations +3";
  GBG = "sudo nix-collect-garbage";
  OPTIMISE = "sudo nix-store --optimise";
  GC = "sudo nix-store --gc";
  CLEANER = "rm -rf ~/.cache/nix && rm -rf /tmp/nix-build-* && rm -rf ~/.local/share/Trash";
  CLEAR = "clear";
  clar = "clear";
  CLS = "clear";
  cls = "clear";
  C = "clear";
  c = "clear";

  PKG = "nix search nixpkgs";
  SRC = "fc-list | grep -i";
  FONTLIST = "fc-match -s";
  SVFONT = "fc-cache -fv";
  GETHASH = "nix store prefetch-file"; ## GETHASH <link>
  PKGLIST = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";
  connect = "sudo tailscale up --operator=$USER";

  ## productivities
  CAM = "~/.local/bin/opencam";
  ## DMUSIC = "yt-dlp --trim-filenames 80 --restrict-filenames -x --audio-format mp3 -S 'abr,codec' -o '~/Musics/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
  ## DVIDEO = "yt-dlp --trim-filenames 80 --restrict-filenames -S 'res:720,codec,br,fps' -f 'bv*+ba/best' -o '~/Videos/%(playlist|NA)s/%(title)s [%(id)s].%(ext)s'";
  IMGCOMPRESS = "~/.local/bin/compress-images.sh";
  DTAR = "~/.local/bin/tar.sh"; ## overwite folder to folder.tar.gz
  XYZ = "~/.local/bin/xyz.sh";
  MPG = "ffmpeg -i"; ## MPG <path/to/img.png> <overwrite/img/file-extension>
  yz = "yazi";
  YZ = "yazi";

  ## POWER
  REBOOT = "sudo reboot";
  OFF = "poweroff";
}


