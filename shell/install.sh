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
#  REQUIREMENTS: zsh, oh-my-zsh, curl
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
    OH_MY_ZSH_INSTALL="x"
    while [ "$OH_MY_ZSH_INSTALL" = "x" ]; do
        echo 'Do you want to install 'oh-my-zsh'? [YyOo]/[Nn]'
        printf "> "
        read -r INPUT
        case "$INPUT" in
            Y|y|O|o) OH_MY_ZSH_INSTALL="y";;
            N|n    ) OH_MY_ZSH_INSTALL="n";;
            *      ) : ;;
        esac
    done
    
    if [ "$OH_MY_ZSH_INSTALL" = y ]; then
        echo "Installing oh-my-zsh"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
        echo "Skipping oh-my-zsh installation"
    fi

    echo "Linking configuration"
    ln -s "$PWD/.zshrc" ~
    ln -s "$PWD/.profile" ~

    echo "Done!"
    echo "If you have troubles with japanese caracters, you can download
        otf-ipafont package using your favourite package manager! For more, see
        https://en.wikipedia.org/wiki/Help:Multilingual_support_%28East_Asian%29#Debian-based_GNU.2FLinux"
fi
