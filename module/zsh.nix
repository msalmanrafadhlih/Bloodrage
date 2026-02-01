{ pkgs, ... }:

{
	users.defaultUserShell = pkgs.zsh;
	programs.zsh = {
	  enable = true;
	  shellAliases = import ./aliases.nix;
	  syntaxHighlighting.enable = true;
	  histSize = 2000;
	  histFile = "$HOME/.config/zsh/.zsh_history";
      setOptions = [
        "APPEND_HISTORY"
        "SHARE_HISTORY"
        "HIST_IGNORE_SPACE"
        "HIST_IGNORE_ALL_DUPS"
        "HIST_FCNTL_LOCK"
        "HIST_SAVE_NO_DUPS"
        "HIST_IGNORE_DUPS"
        "HIST_FIND_NO_DUPS"

        "AUTOCD"
        "PROMPT_SUBST"
        "MENU_COMPLETE"
        "LIST_PACKED"
        "AUTO_LIST"
        "COMPLETE_IN_WORD"
        "RM_STAR_WAIT"
      ];
      
	## ADD PLUGINS FROM ohmyzsh
#	  oh-my-zsh = { # "ohMyZsh" without Home Manager
#	    enable = true;
#	    plugins = [ "git" "" ];
#	    theme = "robbyrussell";
#	  };
	  
	## ADD CUSTOM  PLUGINS
#	  plugins = [
#	    {
#	      # will source zsh-autosuggestions.plugin.zsh
#	      name = "zsh-autosuggestions";
#	      src = pkgs.fetchFromGitHub {
#	        owner = "zsh-users";
#	        repo = "zsh-autosuggestions";
#	        rev = "v0.4.0";
#	        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
#	      };
#	    }
#	    {
#	      name = "enhancd";
#	      file = "init.sh";
#	      src = pkgs.fetchFromGitHub {
#	        owner = "b4b4r07";
#	        repo = "enhancd";
#	        rev = "v2.2.1";
#	        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
#	      };
#	    }
#	  ];
	  shellInit = ''
autoload -Uz compinit
local zcompdump="$HOME/.config/zsh/zcompdump-$ZSH_VERSION"

if [[ -n "$zcompdump"(#qN.mh+24) ]]; then
    compinit -i -d "$zcompdump"
else
    compinit -C -d "$zcompdump"
fi

if [[ ! -f "''${zcompdump}.zwc" || "$zcompdump" -nt "''${zcompdump}.zwc" ]]; then
    zcompile -U "$zcompdump"
fi
	  '';
	};
}
