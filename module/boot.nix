{ boot, ... }:

{
	boot = {
		plymouth = {
			enable = true;
			theme = "breeze"; # spinner, breeze, fade-in, nixos, solar
			extraConfig = "";
#			logo = pkgs.fetchurl {
#				url = "";
#				sha256 = "";
#			};
		};
		consoleLogLevel = 0; # set level log kernel (0=sepi, 7=verbose)
		initrd.verbose = false; # matikan output initrd
		kernelParams = [
			"quiet"
			"loglevel=3"
			"rd.systemd.show_status=0"
			"udev.log_level=3" ];
	};
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.initrd.kernelModules = [
		"i915" # intel
#		"amdgpu" # amd
#		"nvidia-drm.modeset=1" # nvidia
	];
}
