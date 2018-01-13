[ -z "$PS1" ] && return

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

if [ ! -d ~/.vim/bkp ] || [ ! -d ~/.vim/tmp ]; then
  mkdir -p .vim/{tmp,bkp}
fi

if [ -f ~/.bashrc.nso ]; then
  . .bashrc.nso
fi

HISTCONTROL=ignoreboth:erasedups
HISTTIMEFORMAT="[%F - %T] "
HISTSIZE=5000

shopt -s histappend
shopt -s checkwinsize
shopt -s autocd
shopt -s cdspell
shopt -s dirspell
shopt -s cmdhist
shopt -s dotglob
shopt -s nocaseglob

ls --color > /dev/null 2>&1
if [ $? -eq 0 ]; then
	alias ls="ls --color"
else
	alias ls="ls -G"
fi
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias l='ls -Alhp'
alias ll='l -rt'
alias h='history'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias du='du -h'
alias df='df -h'
alias xz='xz -T8 -fkv'
alias path='echo -e ${PATH//:/\\n}'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias rsync='rsync -hP'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mtr='sudo mtr'
alias pg='ping 8.8.8.8'
alias refresh='source ~/.bashrc'

NONE="\[\e[0m\]"    # unsets color to term's fg color
R="\[\e[0;31m\]"    # red
G="\[\e[0;32m\]"    # green
Y="\[\e[0;33m\]"    # yellow
EMK="\[\e[1;30m\]"
EMB="\[\e[1;34m\]"

UC=$G                	    # user's color
[ $UID -eq "0" ] && UC=$R   # root's color

PS1="$EMK[\t $UC\u$EMK@$Y\h $EMB\w$EMK]\\$ $NONE"
case "$TERM" in
    xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1";;
esac

export PAGER=most
export VISUAL=vim
export EDITOR="$VISUAL"
