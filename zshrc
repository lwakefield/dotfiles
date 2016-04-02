# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="sorin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git autojump)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
export TERM="xterm-256color"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Base16 Shell
BASE16_LIGHT_SHELL="$HOME/.config/base16-shell/base16-flat.light.sh"
BASE16_DARK_SHELL="$HOME/.config/base16-shell/base16-flat.dark.sh"
[[ -s $BASE16_DARK_SHELL ]] && source $BASE16_DARK_SHELL

alias lbg='source $BASE16_LIGHT_SHELL'
alias dbg='source $BASE16_DARK_SHELL'
alias s='source ~/.zshrc'
alias vim='mvim -v'
