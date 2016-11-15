#!/bin/bash

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


