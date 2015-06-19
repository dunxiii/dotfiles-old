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

eval `dircolors ~/dotfiles/dircolors-solarized/dircolors.256dark`

alias grep='grep --color'
alias ls='ls -A1 --color=auto'
alias ll='ls -l --color=auto'
