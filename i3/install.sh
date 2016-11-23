#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Raphael EHRET (), raphael[dot]ehret[at]gmail[dot]com
#  ORGANIZATION: 
#       CREATED: 11/21/2016 05:04:47 PM
#      REVISION:  ---
#===============================================================================

set -e 

i3folder="${HOME}/.i3"
dunstfolder="${HOME}/.config/dunst"


# Creating i3 config 
mkdir -p "$i3folder"
ln -sb "$PWD/config" "$i3folder"

# Creating i3status config
ln -sb "$PWD/.i3status.conf" "${HOME}"

# Creating dunst
mkdir -p "$dunstfolder"
ln -sb "$PWD/dunstrc" "$dunstfolder"
