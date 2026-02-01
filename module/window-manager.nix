{ pkgs, services, config, ...  }:

{
  services = {
    xserver = {
        enable = true;
        windowManager = {
            bspwm.enable = true;
        };
        autoRepeatDelay = 300;
        autoRepeatInterval = 35;
        videoDrivers = [ "modesetting" ];
        displayManager = {
        	startx.enable = true;
        	lightdm = {
        		enable = true;
		        background = builtins.fetchurl {
		          url = "https://raw.githubusercontent.com/msalmanrafadhlih/Nixos-Dotsfile/refs/heads/main/config/Assets/Wallpaper/wallpaper8.jpeg";
		          sha256 = "sha256-VZp1wy2N0GApt48ILRY+pIAhAjCt02GmqmxHRTWAEoA=";
		        };
        	};
        };
    };
    
#   displayManager = {
#       autoLogin.enable = true;
#       autoLogin.user = "whiskey";
#   };
  };
}
