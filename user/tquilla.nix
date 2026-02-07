{ config, inputs, ... }:

  let
    create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
    HOME = config.home.homeDirectory;
    USER = config.home.username;
    dots = "${HOME}/.repos/dots/BSPWM";

#	~/.config
    configs = {
		pwm = "bspwm";
		polybar = "polybar";
		sxhkd = "sxhkd";
		nano = "nano";
		rofi = "rofi";
		picom = "picom";
		tmux = "tmux";
		rmpc = "rmpc";
		fastfetch = "fastfetch";
		ncmpcpp = "ncmpcpp";
		bat = "bat";
		btop = "btop";
		dunst = "dunst";
		eww = "eww";
		geany = "geany";
		yazi = "yazi";
		kitty = "kitty";
		helix = "helix";
		"com.kdocker" = "com.kdocker";

#  		alacritty = "alacritty";
#		"gtk-3.0" = "gtk-3.0";
#		ghostty = "ghostty";
#		dmenu = "dmenu";
#		dwm = "dwm";
#		st = "st";

		"vesktop/themes" = "vesktop/themes";
    };

    locals = import ../module/locals.nix;
    in

{
    home.username = "tquilla";
    home.homeDirectory = "/home/tquilla";
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
  	 ../module/zshrc.nix
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
#  	 ../module/xdg-home.nix
  	 ../module/picom.nix
  	 ../module/img-compress.nix
  	 ../module/colorscript.nix
  	 ../module/youtube.nix
  	 ../module/reddit.nix

#  	 ../module/suckless.nix
#  	 ../module/firefox.nix ## This is for Whiskey, not for me! ~ Tquilla

	 ## comment "#" this if you don't want to use spotify with custom theme (spicetify)
  	 ../module/spotify.nix
	inputs.spicetify-nix.homeManagerModules.default
   ];
}
