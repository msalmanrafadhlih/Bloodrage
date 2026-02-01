{ pkgs, lib, ... }:

{
  hardware.enableAllFirmware = true;
  
  # Aktifkan PipeWire sepenuhnya
  services.pipewire = {
	enable = lib.mkForce true;
    alsa.enable = true;          # PipeWire handle ALSA
    alsa.support32Bit = true;
    pulse.enable = true;         # Gantikan PulseAudio
    jack.enable = true;          # Buat kompatibilitas Jack apps
  };

  # Tambahkan tools berguna
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
