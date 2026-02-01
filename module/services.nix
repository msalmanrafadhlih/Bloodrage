{ config, lib, pkgs, service, ...  }:

let
  home = "/home/tquilla";
  db = "/var/lib/mpd";
in

{
  services = {  	
  	journald = {
		storage = "auto";
		extraConfig = ''
			RuntimeMaxUse=50M
			SystemMaxUse=100M
			MaxRetentionSec=14day
			SystemMaxFileSize=10M
		'';
  	};
  };
}
