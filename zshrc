#
# User configuration sourced by interactive shells
#
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TERM=xterm-256color

# Default Editor
export VISUAL=nvim
export EDITOR="$VISUAL"

# Golang
export GOPATH=$HOME/Goland

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.cargo/bin:$HOME/.bin:/usr/local/bin:$GOPATH/bin:$PATH


# Alias
alias vi="nvim"
alias c="clear"

alias imgcat=~/.iterm2/imgcat
alias imgls=~/.iterm2/imgls
alias it2attention=~/.iterm2/it2attention
alias it2check=~/.iterm2/it2check
alias it2copy=~/.iterm2/it2copy
alias it2dl=~/.iterm2/it2dl
alias it2getvar=~/.iterm2/it2getvar
alias it2setcolor=~/.iterm2/it2setcolor
alias it2setkeylabel=~/.iterm2/it2setkeylabel
alias it2ul=~/.iterm2/it2ul
alias it2universion=~/.iterm2/it2universion


# Transfer.sh
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

