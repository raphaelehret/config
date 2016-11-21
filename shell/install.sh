#!/bin/bash - 
#===============================================================================
#
#          FILE: install.sh
# 
#         USAGE: ./install.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: None
#  REQUIREMENTS: zsh, oh-my-zsh
#          BUGS: ---
#         NOTES: This is my own configuration, you may want to modify it
#                 depending on your preferences
#        AUTHOR: Raphael EHRET (), raphael[dot]ehret[at]gmail[dot]com
#  ORGANIZATION: 
#       CREATED: 11/21/2016 10:39:19 AM
#      REVISION:  ---
#===============================================================================

set -e

if [ ! -e "/bin/zsh" ]; then
    echo "Please install zsh before runing this script"
else 
    echo "Installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    echo "Linking configuration"
    ln -s "$PWD/.zshrc" ~
    ln -s "$PWD/.profile" ~
fi
