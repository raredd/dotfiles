# options

# use vi key bindings
set -o vi

# ignore minor misspellings in a cd
shopt -s cdspell

# make history immediately available from all bash instances
shopt -s histappend

# store multiline commands as single command in history
shopt -s cmdhist

# source some bash files
source $HOME/.aliasrc
source $HOME/.funrc

## ----------------------------------------------------- ##

OR="\033[0;33m"
GR="\033[0;32m"
GY="\033[0;37m"
WH="\033[1;37m"
RESET="\033[m"

export PS1="\[$WH\][\[$GR\]\u\[$WH\]@\[$GR\]\h \[$OR\]\W\[$WH\]]\n\[$GY\]\w\n\[$GR\]$ \[$RESET\]"

## ----------------------------------------------------- ##

export BROWSER=brave
export EDITOR=vim
export READER=zathura

export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LSCOLORS=ExFxCxDxBxegedabagacad
export IGNOREEOF=1 # require two C-D to exit shell
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTFILESIZE=100000
export HISTSIZE=10000

## ----------------------------------------------------- ##

export PATH="$HOME/.local/bin:$PATH"
