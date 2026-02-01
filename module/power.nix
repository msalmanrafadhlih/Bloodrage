{ pkgs, ... }:

{
  services.tlp = { 
  	enable = true;
  	settings = {
  		USB_AUTOSUSPEND = 0;
  	};
  };
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
