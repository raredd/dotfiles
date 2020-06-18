# options
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
export LSCOLORS=ExFxCxDxBxegedabagacad
export IGNOREEOF=1 # require two C-D to exit shell
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTFILESIZE=100000
export HISTSIZE=10000

## ----------------------------------------------------- ##
export PATH="$HOME/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/documents/lang/julia:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
export PATH="/opt/local/bin/vim:$PATH"
export PATH="$PATH:~/documents/git/vega-master/bin"
export PATH="/anaconda2/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH=/Users/rawr/CRISPResso_dependencies/bin:$PATH
export BOWTIE_INDEXES="$HOME/genome/indexes"

