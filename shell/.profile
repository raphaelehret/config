#!/bin/sh

############ Local variables ###############

LC_ALL=en_US.UTF-8
export LC_ALL

#Timeout of key combinations
KEYTIMEOUT=1

#Root of the Boost C++ library
BOOST_ROOT=/home/hamtarowarrior/lib/boost
export BOOST_ROOT 

#Set default git editor as vim
GIT_EDITOR=vim
export GIT_EDITOR

#Set default editor as vim
EDITOR=vim
export EDITOR

#Java Openjdk path
JAVA_HOME=/usr/lib/jvm/java-8-openjdk
IDEA_JDK=/usr/lib/jvm/java-8-openjdk
INTELLIJ_HOME=$HOME/src/intellij/bin/idea.sh
export JAVA_HOME
export IDEA_JDK
export INTELLIJ_HOME

# DBUS exportation
DBUS_VALUE_FILEPATH="$HOME/.dbus/Xdbus"
export DBUS_VALUE_FILEPATH

# Adding my own bin folder
PATH=$PATH:~/bin/
export PATH

##################### ALIASES #####################

# Osu
alias osu="sudo ${HOME}/Documents/osu/osulauncher"

# Minecrarft
alias minecraft="java -jar ${HOME}/Documents/Minecraft/Minecraft.jar"

# Put into clip
alias ic="xclip -sel clip"

# Source the shell .rc
if [ $SHELL = "/bin/bash" ]; then
    alias rld="source ~/.bashrc"
elif [ $SHELL = "/bin/zsh" ]; then
    alias rld="source ~/.zshrc"
fi

alias jctl="journalctl -xe"

# SSH
alias sshseed='ssh funkysayu@seedbox.funkysayu.fr'

#Logout
alias lg="killall wpp-changer; i3-msg exit"
alias logout=lg
alias stopx=lg

# Find aliases
alias fname="find . -name \"$1\""
alias fext="find . -name \"*.$1\""
alias fdir="find . -type d $@"
alias ff="find . -type f $@"

# Set python3 as default python
alias python='python3'

# "There is no worst output that uniform and badly colored output" - JEE
alias grep='grep --color=always'

# Set the dual screen to the left of the laptop screen
alias set-screen='xrandr --output eDP1 --right-of DP1-3'

# ls aliases
alias ls="ls --color=auto"
alias ll="ls -larth"
alias l="ls"
alias sl="ls"
alias la="ls -al"

# What zsh could have included
alias rmr='rm -r'
alias cpr='cp -r'

# User systemctl user alias
alias sysu='systemctl --user'

if [ $SHELL = '/bin/zsh' ]; then
    if [ -f '~/.zsh_aliases' ]; then
        source ~/.zsh_aliases
    fi
fi


########## SCRIPTS ################

# Fast C compilation. If no second argument, default name is set for output
function ccomp(){
f=$1
out=$2
if [ ! -z $out ]; then
    gcc -Wall -pedantic $f -o $out
else
    gcc -Wall -pedantic $f
fi
}

### Change the current mac adress
function spoofit (){
    sudo ip link set dev wlp2s0 down
    sudo macchanger -r wlp2s0
    sudo ip link set dev wlp2s0 up
}


############# ENABLING #############

