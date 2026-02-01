{ config, pkgs, nixpkgs-unstable, pkgs-stable, ... }:

{
  home.file.".config/bat/config".text = ''
    --theme="Nord"
#    --style="numbers.changes.grid"
    --paging=auto
  '';
}
