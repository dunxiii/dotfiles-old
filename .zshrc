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

# only load user profile for ranger
export RANGER_LOAD_DEFAULT_RC=FALSE

# disable C+z
set +m

#
# Default editors
#
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export SUDO_EDITOR=/usr/bin/vim

#
# Aliases
#
alias ls='ls --color=auto -h'
alias se='sudoedit'
alias grep='grep --color'

#
# Oh my zsh
#
export ZSH=/home/jack/.oh-my-zsh
DISABLE_AUTO_UPDATE="true"
export PATH=$HOME/bin:/usr/local/bin:$PATH
plugins=(git systemd cp sudo vagrant common-aliases)
ZSH_THEME="gentoo"
source $ZSH/oh-my-zsh.sh
