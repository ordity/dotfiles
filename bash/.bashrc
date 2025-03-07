#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load up colors.
(cat ~/.config/wpg/sequences &)

# Load up prompt customisation
. $HOME/.bashprompt

# Load up aliases.
. $HOME/.bashalias

# Load up y (yazi).
. $HOME/.bashyazi

#### TOOLSET CUSTOMISATION

# Make 'less' use colors
export LESSOPEN='| /usr/bin/source-highlight-esc.sh %s'
export LESS='-R'

# Auto cd
shopt -s autocd

# Load up 'n' for n³ (cd on quit and nested file browsers).
if [ -f /usr/share/nnn/quitcd/quitcd.bash_sh_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_sh_zsh
fi

# Use tmux on new terminal.
if [ -z "$TMUX" ]; then
    tmux
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/media/disk1/projects/inz/deps/anaconda/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/media/disk1/projects/inz/deps/anaconda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/media/disk1/projects/inz/deps/anaconda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/media/disk1/projects/inz/deps/anaconda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# eval "$(oh-my-posh init bash --config ~/.config/ohmyposh/bash_ohmyposh.yaml)"
