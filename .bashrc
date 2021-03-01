#!/usr/bin/env bash
[ -z "$PS1" ] && return

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
[[ -r "/usr/share/bash-completion/bash_completion" ]] && . "/usr/share/bash-completion/bash_completion"

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
export PATH="~/.local/bin:$PATH"
export PATH="$AXIS2_HOME/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
#export PATH="/usr/local/opt/curl/bin:$PATH"
#export PATH="/usr/local/opt/gettext/bin:$PATH"
#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
#export PATH="/usr/local/opt/ncurses/bin:$PATH"
#export PATH="/usr/local/opt/gettext/bin:$PATH"
#export PATH="/usr/local/opt/sqlite/bin:$PATH"
#export PATH="/usr/local/opt/ruby/bin:$PATH"
#export PATH="/usr/local/opt/curl/bin:$PATH"
#export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
#export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
#export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
#export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
#export PATH="/usr/local/opt/libpcap/bin:$PATH"
#export PATH="/usr/local/opt/libxml2/bin:$PATH"
#export PATH="/usr/local/opt/python@3.8/bin:$PATH"

export LANG=en_US.UTF-8
export LC_ALL=$LANG
export FZF_TMUX=1
export BAT_PAGER="less -R"
export FZF_DEFAULT_OPTS="--preview 'bat --color always {}' --preview-window=right:60%"

alias ipython-nso='ipython -i ~/nso.py'

#export SSLKEYLOGFILE=~/.ssl-key.log
alias vpn="tmux new-session -A -s vpn \; send-keys 'source ~/venv/oc/bin/activate; openconnect-sso -s ams-vpn-cluster.cisco.com/ssl -- -s /usr/local/bin/split-script' C-m\;"
