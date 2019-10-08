#!/usr/bin/env bash
[ -z "$PS1" ] && return

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi

if [ ! -d ~/.vim/bkp ] || [ ! -d ~/.vim/tmp ]; then
  mkdir -p .vim/{tmp,bkp}
fi

[ -f ~/.bashrc.nso ] && source ~/.bashrc.nso
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
alias .....='cd ../../../..'
alias mtr='sudo mtr'
alias tailf='tail -f'
alias refresh='source ~/.bashrc'
alias netsim-rekey='find . -path *rsa_key -delete -exec ssh-keygen -t rsa -N "" -m PEM -f {} \;'
[ -x "$(command -v bat)"  ] && alias cat='bat'

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
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export AXIS2_HOME="/Users/lvirot/Downloads/axis2-1.7.9"
export PATH="$AXIS2_HOME/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/Users/lvirot/Repos/github.com/origin/cmd/oc:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=$LANG
export FZF_TMUX=1
export BAT_PAGER="less"
export FZF_DEFAULT_OPTS="--preview 'bat --color always {}' --preview-window=right:60%"
export LDFLAGS="-L/usr/local/opt/libxml2/lib"
export CPPFLAGS="-I/usr/local/opt/libxml2/include"
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

alias zext='ssh cisco_lvirot@ext-dev-a.bastions.ovh.net -p222 -t -- '
alias zdevpub='zext realm_cisco@pub-dev.bastions.ovh.net -t -- '
alias nso-ovh='zdevpub ubuntu@51.68.90.238'


alias ipython-nso='ipython -i ~/nso.py'
