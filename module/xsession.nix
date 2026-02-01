{ config, pkgs, ... }:

{
  
  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "vivaldi";
    TERMINAL = "st";
  };

  xsession = {
    enable = true;
    windowManager.command = "bspwm";
    
    # Tambahan script sebelum menjalankan WM (setara isi .xinitrc kamu)
    initExtra = ''
	    eval "$(dbus-launch --sh-syntax)"
	    export DBUS_SESSION_BUS_ADDRESS
	    
		export XCURSOR_THEME=Kafka
		export XCURSOR_SIZE=14
		xsetroot -cursor_name left_ptr
		mpDris2 &
    '';
  };
  
}
