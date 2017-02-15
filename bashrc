### PLEASE DO NOT EDIT THIS FILE ###
# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
# append to the history file, don't overwrite it
shopt -s histappend
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi
unset color_prompt force_color_prompt
# prompt
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
rs(){ cat /dev/urandom|tr -dc 'a-zA-Z0-9'|head -c ${1:-32};echo "";}
# Alias definitions.
alias l='ls -lah'
alias ll='ls -l'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias df='df -h'
alias nginx='docker ps|grep front|awk '"'"'{print "docker exec -i "$1" /etc/init.d/nginx reload"}'"'"'|sh'

if hash vim 2>/dev/null; then
  alias vi='vim'
fi
alias httplog='sudo tail -f /var/log/nginx/*log'
alias google-chrome='google-chrome --user-data-dir'
if [ -f $HOME/.aliases ];then
  . $HOME/.aliases
fi
export EDITOR=/usr/bin/vi
export TERM=xterm-256color
if [ -z "$STY" ]; then
  if hash screen 2>/dev/null; then
    screen -xRR
  else
    cd
  fi
fi
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
