{ config, pkgs, libs, ... }:

  let
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    home = config.home.homeDirectory;
    dots = "/home/whiskey/.repos/nixos";

#	~/.config
    configs = {    
		bspwm = "bspwm";
  		alacritty = "alacritty";
  		polybar = "polybar";
		sxhkd = "sxhkd";
		nano = "nano";
		rofi = "rofi";
		ghostty = "ghostty";
		picom = "picom";
		st = "st";
		nvim = "nvim";
		tmux = "tmux";
		dunst = "dunst";
		dmenu = "dmenu";
		eww = "eww";
		dwm = "dwm";
		
  	  	"systemd/user/battery-notif.service" = "systemd/user/battery-notif.service";
  	  	"systemd/user/battery-notif.timer" = "systemd/user/battery-notif.timer";
    };

    locals = {
    	".icons" = "icons";
    };
    in

{
    home.username = "whiskey";
    home.homeDirectory = "/home/whiskey";
    programs.git.enable = true;
    home.stateVersion = "25.05";

   xdg.configFile = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${dots}/config/${subpath}";
  	recursive = true;
   }) configs;	
   
   home.file = builtins.mapAttrs (name: subpath: {source = 
  	create_symlink "${dots}/config/${subpath}";
  	recursive = true;
   }) locals;	
   
   imports = [
  	../module/bash.nix
  	../module/packages.nix
  	../module/bat.nix
  	../module/xsession.nix	
  	../module/battery.nix
  	../module/brightness.nix
  	../module/volume.nix
  	../module/media.nix
  	../module/nanorc.nix
  	../module/git-prompt.nix
  	../module/tar.nix
  	../module/xyz.nix
  	../module/hide-polybar.nix
  	../module/show-polybar.nix
  	../module/background.nix
  	../module/opencam.nix
  	../module/bookmarks.nix
  	../module/github-repos.nix
  	../module/tmux-sessions.nix
  	../module/run.nix
  	../module/mpd.nix
  	../module/firefox.nix
  	
#  	../module/suckless.nix  	
    inputs.textfox.homeManagerModules.default
   ];
}
