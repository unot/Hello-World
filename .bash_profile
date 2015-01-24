export HISTSIZE=1000000
export HISTCONTROL=ignoreboth
export HISTIGNORE='history:ls'
export PS1='\[\e[1;33m\]\u@\h \w ->\n\[\e[1;31m\][\@ \d]\$\[\e[m\] '
export LESS='-R'
export LESSOPEN='| src-hilite-lesspipe.sh %s'
alias ls='ls -FG'
alias ll='ls -lhFG'
alias ..='cd ..'

export PATH=/usr/texbin:$PATH

shopt -s globstar
shopt -s autocd
shopt -s cdable_vars
shopt -s extglob
shopt -s nocaseglob

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi
