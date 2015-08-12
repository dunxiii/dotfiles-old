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

#
# Default editors
#
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export SUDO_EDITOR=/usr/bin/vim

#
# Get some keys to work normal
#
bindkey "[3~" delete-char

# for freebsd console
#bindkey "[H" beginning-of-line
#bindkey "[F" end-of-line

# for rxvt
bindkey "[8~" end-of-line
bindkey "[7~" beginning-of-line

#
# Aliases
#

# Pacman
alias suy='sudo pacman -Suy'
alias syy='sudo pacman -Syy'
alias pacs='sudo pacman -S'
alias pacr='sudo pacman -Rs'

# ls
alias ls='ls --color=auto'
alias ls='ls'
alias ll='ls -l'

alias se='sudoedit'
alias grep='grep --color'
