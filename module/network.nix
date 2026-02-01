{ networking, ... }:

{
	services.mullvad-vpn.enable = true;
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 22 ];
        allowedUDPPorts = [ 60000 60001 60002 60003 60004 60005 60006 60007 60008 60009 60010 ];
    };
    networking.networkmanager.enable = true;
    networking.hostName = "nixos";
}
