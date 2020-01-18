export TERM='screen-256color'
export EDITOR='vim'
set -o vi

alias l="ls -lah"
alias u="cd .."
alias l.="ls -lda */"
alias d="du -d 1 -h"

#export PATH=$HOME/.gem/ruby/2.4.0/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
