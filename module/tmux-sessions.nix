{ sessions, libs, programs, ... }:

{
  home.file.".local/bin/tmux-sessions.sh" = {
	text = ''
#!/usr/bin/env bash

PERM_FILE="$HOME/.config/tmux/permanent-sessions.txt"
mkdir -p "$(dirname "$PERM_FILE")"
touch "$PERM_FILE"

ADD_OPTION="➕ Add new permanent session"

case "$@" in
    "") # mode list (print ke rofi)
        PERMANENT_SESSIONS=$(cat "$PERM_FILE")
        TMUX_SESSIONS=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)
        printf "%s\n" $PERMANENT_SESSIONS $TMUX_SESSIONS "$ADD_OPTION" | sort -u
        ;;
    "$ADD_OPTION") # tambah permanen baru
        NEW_SESSION=$(rofi -dmenu -p "New session name")
        [ -z "$NEW_SESSION" ] && exit 0
        echo "$NEW_SESSION" >> "$PERM_FILE"
        if tmux has-session -t "$NEW_SESSION" 2>/dev/null; then
            exec tmux attach -t "$NEW_SESSION"
        else
            if [ -z "$(tmux list-sessions 2>/dev/null)" ]; then
                exec st -e tmux new -s "$NEW_SESSION"
            else
                exec tmux new -s "$NEW_SESSION"
            fi
        fi
        ;;
    *) # pilih session dari list
        SESSION="$@"
        if tmux has-session -t "$SESSION" 2>/dev/null; then
            exec tmux attach -t "$SESSION"
        else
            if [ -z "$(tmux list-sessions 2>/dev/null)" ]; then
                exec st -e tmux new -s "$SESSION"
            else
                exec tmux new -s "$SESSION"
            fi
        fi
        ;;
esac

	'';
	executable = true;
  };
}
