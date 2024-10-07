#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# 256 color codes:
# https://user-images.githubusercontent.com/995050/47952855-ecb12480-df75-11e8-89d4-ac26c50e80b9.png

ESC=$(printf "\e")
# C1="$ESC[38;5;130m"
# C2="$ESC[38;5;112m"
C1="$ESC[33m"
C2="$ESC[32m"
CR="$ESC[0m"

PS_LINE_1="\[${C1}\]┌─[\[${C2}\]\u@\h\[${C1}\]]──[\[${C2}\]\A\[${C1}\]]"
PS_LINE_2="\[${C1}\]└─[\[${C2}\]\W\[${C1}\]]\[${CR}\] "

[ -n "$NNNLVL" ]

PS_NLVL="─[\[${C2}\]N$NNNLVL\[${C1}\]]"

PS1="$PS_LINE_1$PS_NLVL \n$PS_LINE_2"
# \u user
# \h host
# \W location (just the last part)
# \w full location
# \[${C1}\] color 1
# \[${C2}\] color 2
# \[${CR}\] color reset
#
(cat ~/.config/wpg/sequences &)
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R'

#alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ping='prettyping'
alias nm='nmtui'
alias audio='pulsemixer'
alias vim='nvim'
alias ls='eza'
alias top='btop'
alias nf='neofetch'
alias nnn='nnn -e'
alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"

if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

if [ -z "$TMUX" ]; then
    tmux
fi

