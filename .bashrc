#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

source $HOME/.aliases
source /usr/share/bash-completion/bash_completion

export PS1="\u@\h > "
