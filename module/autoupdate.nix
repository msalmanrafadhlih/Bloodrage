{ system, ... }:

{
  system.autoUpgrade = {
    enable = true;

    flake = "/home/tquilla/.repos/nixos";

    flags = [
      "--update-input" "nixpkgs"
      "--commit-lock-file"
    ];

    dates = "*/3 days";
    randomizedDelaySec = "30min";

    allowReboot = false;
  };
}
