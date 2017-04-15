# This script uses oh-my-zsh
# https://github.com/robbyrussell/oh-my-zsh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Loads zmv plugin 
autoload -U zmv

ZSH_GRAPHIC_THEME="xiong-chiamiov"
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

plugins=(git sudo pip archlinux fancy-ctrl-z docker docker-compose)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Load the general profile file
source ~/.profile

# Load old zsh options
#source ~/.zsh_profile

# Load Syntax HighLighting
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
