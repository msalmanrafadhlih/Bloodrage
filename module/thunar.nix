{ programs, libs, pkgs, ... }:

{
  programs = {
  	nix-ld.enable = true;
	thunar = {
		enable = true;
		plugins = with pkgs.xfce; [
			thunar-volman
			thunar-dropbox-plugin
			thunar-vcs-plugin
			thunar-media-tags-plugin
		];
	};
  };
  services.tumbler.enable = true; # thumbnails di Thunar  
}
