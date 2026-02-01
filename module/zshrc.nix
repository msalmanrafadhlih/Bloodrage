{ ... }:

{
  home.file.".zshrc" = {
  	text = ''
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -z "$TMUX" ]; then
    sessions=''$(tmux list-sessions 2>/dev/null | wc -l)

    if [ "$sessions" -eq 0 ]; then
        tmux new-session
    else
        tmux attach-session \; choose-session
    fi
fi

#eval "$(tv init zsh)"

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

#  ┬  ┬┌─┐┬─┐┌─┐
#  └┐┌┘├─┤├┬┘└─┐
#   └┘ ┴ ┴┴└─└─┘
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export SUDO_PROMPT="Deploying root access for %u. Password pls: "
export BAT_THEME="base16"

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

SAVEHIST=5000
HISTDUP=erase

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ''${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=90% --pointer '>' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

#  ┬ ┬┌─┐┬┌┬┐┬┌┐┌┌─┐  ┌┬┐┌─┐┌┬┐┌─┐
#  │││├─┤│ │ │││││ ┬   │││ │ │ └─┐
#  └┴┘┴ ┴┴ ┴ ┴┘└┘└─┘  ─┴┘└─┘ ┴ └─┘
expand-or-complete-with-dots() {
  echo -n "\e[31m…\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#  ┌┬┐┬ ┬┌─┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐
#   │ ├─┤├┤   ├─┘├┬┘│ ││││├─┘ │
#   ┴ ┴ ┴└─┘  ┴  ┴└─└─┘┴ ┴┴   ┴
setopt PROMPT_SUBST

function dir_icon {
  if [[ "$PWD" == "$HOME" ]]; then
    echo "%B%F{cyan} %f%b"
  else
    echo "%B%F{cyan} %f%b"
  fi
}
autoload -Uz vcs_info
precmd() { vcs_info }

PS1=$'%B%F{blue} %f%b %B%F{magenta}%n%f%b $(dir_icon) %B%F{yellow}%~%f%b''${vcs_info_msg_0_}\n%(?.%B%F{green}.%F{red})%f%b '

#  ┌─┐┬  ┬ ┬┌─┐┬┌┐┌┌─┐
#  ├─┘│  │ ││ ┬││││└─┐
#  ┴  ┴─┘└─┘└─┘┴┘└┘└─┘
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#source ~/.config/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

#  ┌─┐┬ ┬┌─┐┌┐┌┌─┐┌─┐  ┌┬┐┌─┐┬─┐┌┬┐┬┌┐┌┌─┐┬  ┌─┐  ┌┬┐┬┌┬┐┬  ┌─┐
#  │  ├─┤├─┤││││ ┬├┤    │ ├┤ ├┬┘│││││││├─┤│  └─┐   │ │ │ │  ├┤
#  └─┘┴ ┴┴ ┴┘└┘└─┘└─┘   ┴ └─┘┴└─┴ ┴┴┘└┘┴ ┴┴─┘└─┘   ┴ ┴ ┴ ┴─┘└─┘
function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "''${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "''${(q)1}\e\\"; }
}

if [[ "$TERM" == (kitty*|alacritty*|tmux*|screen*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

#  ┌─┐┬ ┬┌┬┐┌─┐  ┌─┐┌┬┐┌─┐┬─┐┌┬┐
#  ├─┤│ │ │ │ │  └─┐ │ ├─┤├┬┘ │
#  ┴ ┴└─┘ ┴ └─┘  └─┘ ┴ ┴ ┴┴└─ ┴
# $HOME/.local/bin/colorscript -r
#disable-fzf-tab


# === DOWNLOAD AUDIO (MUSIC) ===
DMUSIC() {
    # Ambil argumen pertama sebagai URL
    local url="$1"

    # Cek apakah ada URL
    if [ -z "$url" ]; then
        echo "Usage: DMUSIC \"<url>\""
        return 1
    fi

    yt-dlp \
        --no-playlist \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --embed-metadata \
        --parse-metadata "playlist_index:%(track_number)s" \
        --format "ba/best" \
        --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
        --add-header "Accept-Language: en-US,en;q=0.9" \
        --retry-sleep 3 \
        --retries infinite \
        --download-archive "$HOME/Musics/downloaded_archive.txt" \
        --output "$HOME/Musics/%(artist)s/%(title)s.%(ext)s" \
        --extractor-args "youtube:player_client=android" \
        --restrict-filenames \
        --windows-filenames \
        "$url"
}

# === DOWNLOAD VIDEO ===
DVIDEO() {
    local url="$1"

    if [ -z "$url" ]; then
        echo "Usage: DVIDEO \"<url>\""
        return 1
    fi

    # Hapus duplikat --format yang salah di kodemu sebelumnya
    yt-dlp \
        --no-playlist \
        --format "bestvideo[height<=720]+bestaudio/best[height<=720]" \
        --embed-thumbnail \
        --embed-metadata \
        --embed-chapters \
        --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
        --add-header "Accept-Language: en-US,en;q=0.9" \
        --retry-sleep 3 \
        --retries infinite \
        --merge-output-format mkv \
        --download-archive "$HOME/Videos/downloaded_archive.txt" \
        --output "$HOME/Videos/%(uploader)s/%(title)s [%(id)s].%(ext)s" \
        --extractor-args "youtube:player_client=android" \
        --restrict-filenames \
        "$url"
}

# === DOWNLOAD PLAYLIST ===
DPLAYLIST() {
    local url="$1"

    if [ -z "$url" ]; then
        echo "Usage: DPLAYLIST \"<url>\""
        return 1
    fi

    yt-dlp \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --embed-metadata \
        --yes-playlist \
        --ignore-errors \
        --format "ba/best" \
        --user-agent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" \
        --add-header "Accept-Language: en-US,en;q=0.9" \
        --retry-sleep 3 \
        --retries infinite \
        --download-archive "$HOME/Musics/downloaded_archive.txt" \
        --output "$HOME/Musics/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" \
        --extractor-args "youtube:player_client=android" \
        "$url"
}
  '';
  	executable = true;
  };
}
