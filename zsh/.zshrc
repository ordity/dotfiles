# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=5000
SAVEHIST=5000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/bsaw/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

(cat ~/.config/wpg/sequences &)

. $HOME/.zshyazi
. $HOME/.zalias
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R'

if [ -z "$TMUX" ]; then
    tmux
fi

eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/zsh_ohmyposh.yaml)"
