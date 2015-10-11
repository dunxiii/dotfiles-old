# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
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

# Make colors behave correct
export TERM=xterm-256color

#
# Default editors
#
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export SUDO_EDITOR=/usr/bin/vim

#
# Get some keys to work normal
#
case "$TERM" in
    xterm-256color)
        bindkey "[8~" end-of-line
        bindkey "[7~" beginning-of-line
        bindkey "[3~" delete-char
        # Disables flow control in terminal, ctrl+s does not freeze
        stty -ixon
        ;;
esac

#
# Aliases
#
alias ls='ls --color=auto'
alias ll='ls -l'
alias se='sudoedit'
alias grep='grep --color'

#
# Oh my zsh
#
export ZSH=/home/jack/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
export PATH=$HOME/bin:/usr/local/bin:$PATH
plugins=(git systemd cp)
ZSH_THEME="gentoo"
source $ZSH/oh-my-zsh.sh
