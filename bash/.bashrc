#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load up colors.
(cat ~/.config/wpg/sequences &)


#### PROMPT SETUP
# 256 color codes:
# https://user-images.githubusercontent.com/995050/47952855-ecb12480-df75-11e8-89d4-ac26c50e80b9.png
# Those would be useful in terminal without the full RGB support.

# Set N³ level variable.
[ -n "$NNNLVL" ]

# Make the escape character a variable for conciseness.
ESC=$(printf "\e")

# Set the 16 foreground colors as variables.
BLACK="$ESC[30m"
RED="$ESC[31m"
GREEN="$ESC[32m"
YELLOW="$ESC[33m"
BLUE="$ESC[34m"
MAGENTA="$ESC[35m"
CYAN="$ESC[36m"
WHITE="$ESC[37m"
B_BLACK="$ESC[90m"
B_RED="$ESC[91m"
B_GREEN="$ESC[92m"
B_YELLOW="$ESC[93m"
B_BLUE="$ESC[94m"
B_MAGENTA="$ESC[95m"
B_CYAN="$ESC[96m"
B_WHITE="$ESC[97m"
RESET="$ESC[0m"
BACKGROUND="$BLACK"
FOREGROUND="$B_WHITE"

# Set shortcuts for the variables.
C1="$YELLOW"
C2="$GREEN"
C3="$CYAN"
C4="$RED"
C5="$BLUE"
CR="$RESET"

## Global prompt modules.
MODULE_NODEB="\[${C3}\]■\[${C1}\]"
MODULE_NODEP="\[${C4}\]■\[${C1}\]"
DOT="\[${C5}\]·\[${C1}\]"

## PS1 Modules (primary prompt).
# I use modules for bash prompt. Writing them all down manually is annoying to reuse.
# Separating all the module elements into separate variables makes it easier to work with them.
#
# Some useful options:
# \u user
# \h host
# \W location (just the last part)
# \w full location
#
# Build first line.
MODULE_NAME="[\[${C2}\]\u@\h\[${C1}\]]"
MODULE_DATE="[\[${C2}\]\d\[${C1}\]]"
MODULE_TIME="[\[${C2}\]\A\[${C1}\]]"
MODULE_NLVL="[\[${C2}\]N$NNNLVL\[${C1}\]]"
PS_LINE_1="$MODULE_NODEB─┬─$MODULE_NAME─$DOT─$MODULE_TIME─$DOT─$MODULE_DATE─$DOT─$MODULE_NLVL──$MODULE_NODEB"

# Build second line.
MODULE_CDIR="[\[${C2}\]\W\[${C1}\]]"
MODULE_INPT="··$DOT\[${CR}\] "
PS_LINE_2="\[${C1}\]  └─$MODULE_CDIR──$MODULE_INPT"

# Build the full PS1
PS1="$PS_LINE_1\n$PS_LINE_2"

## PS2 Modules (Prompt on multi-line).
PS2=" $MODULE_NODEP──[\[${C2}\]···\[${C1}\]]─··$DOT\[${CR}\] "


#### TOOLSET CUSTOMISATION

## ALIASES
# Make grep use colors.
alias grep='grep --color=auto'
# Use 'prettyping' instead of 'ping'.
alias ping='prettyping'
alias nm='nmtui'
alias audio='pulsemixer'
# Use neovim instead of vim.
alias vim='nvim'
# Better alternative for ls.
alias ls='eza'
# Better alternative for top.
alias top='btop'
alias nf='neofetch'
# Make n³ use vim for editing text.
alias nnn='nnn -e'
# Get list of n³ selected files.
alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"

# Make 'less' use colors
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R'

# Load up 'n' for n³ (cd on quit and nested file browsers).
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

# Use tmux on new terminal.
if [ -z "$TMUX" ]; then
    tmux
fi

