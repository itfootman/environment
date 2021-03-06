# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi 
#export JAVA_HOME=/opt/jdk1.8.0_131
#export JAVA_HOME=/opt/jdk1.8.0_121
export PATH=$HOME/program/bin:$HOME/.cabal/bin:$JAVA_HOME/bin:/usr/local/cuda/bin:$HOME/program/mongodb-linux-x86_64-3.0.1/bin:$PATH 
export CLASSPATH=$JAVA_HOME/jre/lib/rt.jar

function gvim () { (/usr/bin/gvim "$@" > /dev/null 2>/dev/null &) }

#export ANDROID_SDK=/home/$HOME/develop/android-ndk-sdk/android-new-linux
#export PATH=$ANDROID_SDK/platform-tools:$ANDROID_SDK/tools:$PATH
#export PATH=$HOME/program/bcompare/bin:$PATH

# An easy method to get terminal name.

if [ -z "$TERM_NAME" ]; then
  export TERM_NAME=`ps -p $(ps -p $$ -o ppid=) -o args=`
fi
#export SCREEN_COLS=`tput cols`
#Load self defined commands.
SELF_COMMAND=$HOME/program/bin/command.sh
if [ -e "$SELF_COMMAND" ]; then
  . $SELF_COMMAND
fi

SVN_COMMAND=$HOME/program/bin/svn-color.sh

if [ -e "$SVN_COMMAND" ]; then
    . $SVN_COMMAND
fi
#function getTerminal() {
#   local terminalName=
#   local terminalIndex=
#   local finalTermName=
#   terminalName=`ps -p $(ps -p $$ -o ppid=) -o args=`
#   if [ `expr match "$terminalName" 'konsole'` -eq 7 ]; then
#       finalTermName="konsole"
#   elif [ `expr match "$terminalName" 'gnome'` -eq 5 ]; then
#       finalTermName="gnome"
#   fi
#   export COLORTERM=$finalTermName
#}
#
#getTerminal
#export SCREEN_COLS=`tput cols`
#function setcols() {
#  export SCREEN_COLS=`tput cols`
#}

alias vi='vim'
alias pd=pushd
alias gi=gvim
alias dr='dirs -v'

if [ -e "$HOME/.ssh/config" ]; then
    complete -W "$(echo $(grep '^Host ' ~/.ssh/config  | sort -u | sed 's/^xsh //'))" xsh
fi
#. /usr/share/doc/cdargs/examples/cdargs-bash.sh

export NODE_PATH="/usr/lib/node_modules"


PATH=$PATH:/home/broton/program/010editor;export PATH;
# ADDED BY INSTALLER - DO NOT EDIT OR DELETE THIS COMMENT - 87FF8EFC-483D-BCAA-D67D-735CF60410D1 80AE73C1-9DEA-5702-CD4E-51F36CCF422F


#source ~/.xsh

