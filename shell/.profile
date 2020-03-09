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

alias xclip="xclip -selection clipboard"

########## TAS VARS ###############

export TAS="/asterix/THALES_ALENIA_SPACE_Toulouse_3114_05150_Externalisation_R3"

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
    name="$1"; shift;
    find . -name "$name" "$@"
}
fext() { 
    name="$1"; shift;
    find . -name "*.$name" "$@"
}
fdir() { 
    find . -type d "$@"  
}
ff() { 
    find . -type f "$@"  
}

close_all_sockets() {
    for socket in ~/.ssh/sessions/*.socket; do
        hostname=$(basename "$socket" .socket | cut -d':' -f1)
        echo "Closing $socket for host $hostname"
        ssh $hostname -O exit
    done
}

path_dos2unix() {
    sed 's|\\|/|g' <<< "$@" | tee | xclip
}
