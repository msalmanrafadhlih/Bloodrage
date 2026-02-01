{ config, pkgs, ... }:

{
	## DBUS SESSION
	services = {
		dbus.enable = true;
		udisks2.enable = true;
		gvfs = {
	        enable = true;
	        package = pkgs.gnome.gvfs;
	    };

	    dbus.packages = with pkgs; [
	        dconf
	    ];
	};
	programs.dconf.enable = true;

	## XDG PORTAL (X11 Only)
	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = true;
		extraPortals = with pkgs; [
		  xdg-desktop-portal-gtk
		];
		config = {
		  common = {
		    default = [ "gtk" ];
		  };
		};
	};

	environment.sessionVariables = {
		XDG_CURRENT_DESKTOP = "gtk";
		XDG_SESSION_TYPE = "x11";
	};

	xdg.mime.enable = true;
#	xdg.mime.defaultApplications = {}

	# Make sure the application packages are installed
	environment.systemPackages = with pkgs; [
		qview
	];
}
