{ acme, ... }:

{
  user.users.nginx = {
	extraGroups = [ "acme" ];
  };
  services.nginx = {
	enable = true;
	virtualHost."example@gmaildummy.work" = {
		useACMEHost = "example@gmaildummy.work";
		forceSSL = true;
		locations."/" = {
			root = "/data/webserver/";
			index = "index.txt";
		};
	};
  };
}

