# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jack/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt HIST_IGNORE_DUPS

autoload -U promptinit
promptinit

# only load user profile for ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

#
# Don't open ranger if ranger is running
#
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger
    else
        exit
    fi
}

#
# Default editors
#
# This vim is a script that resolvs symlinks
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export SUDO_EDITOR=/usr/local/bin/vim

#
# Oh my zsh
#
export ZSH=/home/jack/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
export PATH=$HOME/bin:/usr/local/bin:$PATH
plugins=(colored-man-pages git systemd cp sudo vagrant common-aliases)
ZSH_THEME="gentoo"
source $ZSH/oh-my-zsh.sh

#
# Aliases
#
alias ll='ls -lh'
alias ls='ls --color=auto -h'
alias se='sudoedit'
alias grep='grep --color'

