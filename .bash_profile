export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
alias ..="cd .."
alias ls='ls -pa'
alias vim="mvim"
alias c="clear"

set -o vi
# OPAM configuration
. /Users/wesleyt/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
