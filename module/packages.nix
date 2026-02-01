{
  pkgs,
  inputs,
  ...
}: {
  home.packages =
    (with pkgs; [
      # stable packages
      fastfetch
      rofi
      gimp
      vivaldi
      tmux

      nixpkgs-fmt
      nodejs_24
      feh
      gcc

      font-manager
      picard
      jellyfin-ffmpeg
      ungoogled-chromium
      libreoffice
      zoom
      evince
      obs-studio
      flameshot
	helix
	gparted

    #  inputs.nixcats.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
    ++ (with pkgs.unstable; [
      # unstable packages
      ani-cli
      yt-dlp
      timg
      vesktop
      kdocker
      yazi
      rmpc
      kitty
      geany
    ]);
}
