# This script uses oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Loads zmv plugin 
autoload -U zmv

ZSH_GRAPHIC_THEME="my_agnoster"
ZSH_NO_GRAPHIC_THEME="xiong-chiamiov"
#DEFAULT_USER=hamtarowarrior

# Chosing the theme to display depending on whether or not x is launched
if ! xset q &> /dev/null; then
    ZSH_THEME=$ZSH_NO_GRAPHIC_THEME
else
    ZSH_THEME=$ZSH_GRAPHIC_THEME
fi

# Uncomment the following line to disable bi-weekly auto-update checks.
#DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git sudo pip archlinux docker docker-compose colored-man-pages)

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Load the general profile file
source ~/.profile

# Load Syntax HighLighting
syntax_plugin="${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
[[ -f "$syntax_plugin" ]] && source $syntax_plugin
