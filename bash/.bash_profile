#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export QT_QPA_PLATFORMTHEME=""

# NNN config:
export NNN_BMS='D:~/Documents/;h:~/;d:~/Downloads/;p:/media/disk1/projects/'

NNN_PLUG_EDIT_FILE='e:-! vim "$nnn";E:-!sudo -E vim "$nnn"'
NNN_PLUG_ADMIN='x:!chmod +x "$nnn"'
# NNN_PLUG_UTIL=''

NNN_PLUG="$NNN_PLUG_EDIT_FILE;$NNN_PLUG_ADMIN"

export NNN_PLUG

# exec ~/.config/wpg/wp_init.sh
