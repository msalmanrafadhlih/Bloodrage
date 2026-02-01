{ users, ... }:

{
    users.users = {
        # whiskey = {
        #   isNormalUser = true;
        #   extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
        # };

        tquilla = {
          isNormalUser = true;
          extraGroups = [ "wheel" "audio" "video" "networkmanager" ];
        };
    };
}
