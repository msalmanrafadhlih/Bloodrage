{ pkgs, ... }:

{
  home.packages = with pkgs; [
	(pkgs.st.overrideAttrs (_: {
		src = inputs.st-src;
		patches = [ ];
	}))
    (pkgs.dmenu.overrideAttrs (_: {
        src = inputs.dmenu-src;
        patches = [ ];
    }))
	slock
	surf
  ];
}
