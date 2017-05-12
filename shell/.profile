#!/bin/sh

############ Local variables ###############

# Excluding unwanted warnings from shellcheck
# SC1091 : file not found, no permissions, not included on the command line, not allowing shellcheck to follow files with -x, etc.
export SHELLCHECK_OPTS="--exclude=SC1091"

export LC_ALL=en_US.UTF-8

#Timeout of key combinations
export KEYTIMEOUT=1

#Root of the Boost C++ library
export BOOST_ROOT=/home/hamtarowarrior/lib/boost

#Set default git editor as vim
export GIT_EDITOR=vim

#Set default editor as vim
export EDITOR=vim

# DBUS exportation
export DBUS_VALUE_FILEPATH="$HOME/.dbus/Xdbus"

# Adding my own bin folder
export PATH=$PATH:~/bin/

# shellcheck disable=SC1090
[ -f "${HOME}/.aliases" ] && . "${HOME}/.aliases"

########## SCRIPTS ################

# Fast C compilation. If no second argument, default name is set for output
ccomp(){
    # shellcheck disable=SC2039
    local f=$1 out=$2
    if [ -n "$out" ]; then
        gcc -Wall -pedantic "$f" -o "$out"
    else
        gcc -Wall -pedantic "$f"
    fi
}

# Find functions 
fname(){ 
    find . -name "$1"  
}
fext() { 
    find . -name "*.$1"
}
fdir() { 
    find . -type d "$@"  
}
ff() { 
    find . -type f "$@"  
}
