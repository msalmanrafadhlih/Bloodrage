{ systems, pkgs, ... }:
{
	hardware.graphics = {
	  enable = true;
	  enable32Bit = true;
	  extraPackages = with pkgs; [
	    intel-media-driver  # driver modern untuk iGPU Intel (UHD/Iris)
	    intel-vaapi-driver          # fallback untuk GPU Intel lama
	    libvdpau-va-gl      # kompatibilitas VDPAU (opsional tapi aman)
	  ];
	};
}
