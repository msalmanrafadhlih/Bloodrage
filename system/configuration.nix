{ config, lib, pkgs, ... }:

{
	imports = [
		./hardware-configuration.nix
	];
  		
	time.timeZone = "Asia/Jakarta";
	
	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keyMap = "us";
	};
		
	nix.gc = {
		automatic = true;
		dates = "daily";
		options = "--delete-older-than 3d";
	};
	

	security.rtkit.enable = true;
	system.stateVersion = "25.05";
	nixpkgs.config.allowUnfree = true;
}

