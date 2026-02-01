{ sudo, ... }:

{
	security.sudo.extraRules = [{
	  users = [ "tquilla" ];
	  commands = [{
	    command = "ALL";
	    options = [ "NOPASSWD" ];
	  }];
	}];
}

