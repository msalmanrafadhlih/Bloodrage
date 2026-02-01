{ config,  pkgs, ... }:
let
	USER = config.home.username;
in
{
  programs.firefox = {
    enable = true;
	package = pkgs.firefox-bin;

	profiles."${USER}".extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      bitwarden
    ];
  };
  
  ## TEXTFOX
  textfox = {
      enable = true;
      profile = "${USER}";
      config = {
        tabs.horizontal.enable = false;
        displayWindowControls = true;
        displayNavButtons = false;
        displayUrlbarIcons = true;
        displaySidebarTools = true;
        displayTitles = true;
        newtabLogo = " __        __   _                            _                _      _   _                 _      _ _ 
 \ \      / /__| | ___ ___  _ __ ___   ___  | |__   __ _  ___| | __ | | | | ___  _ __ ___ (_) ___| | |
  \ \ /\ / / _ \ |/ __/ _ \| '_ ` _ \ / _ \ | '_ \ / _` |/ __| |/ / | |_| |/ _ \| '_ ` _ \| |/ _ \ | |
   \ V  V /  __/ | (_| (_) | | | | | |  __/ | |_) | (_| | (__|   <  |  _  | (_) | | | | | | |  __/_|_|
    \_/\_/ \___|_|\___\___/|_| |_| |_|\___| |_.__/ \__,_|\___|_|\_\ |_| |_|\___/|_| |_| |_|_|\___(_|_)";
        font = {
          family = "jetBrainsMono Nerd Font";
          size = "14px";
        };
      };
  };
}
