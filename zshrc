# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="sorin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git autojump)

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH
source $ZSH/oh-my-zsh.sh
export CLICOLOR=1
export TERM="xterm-256color"
export ANDROID_HOME=/usr/local/opt/android-sdk

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-harmonic16-dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

defaults write NSGlobalDomain KeyRepeat -int 0

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

alias lbg='source $BASE16_LIGHT_SHELL'
alias dbg='source $BASE16_DARK_SHELL'
alias s='source ~/.zshrc'
alias vim='nvim'
alias server='python -m SimpleHTTPServer'
alias weather='curl -4 wttr.in'
alias chromeless='open -a "Google Chrome" -n --args "--app=http://localhost:8080"'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'

alias rand-str='env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 64'
alias list='du -sh ./* | gsort -h'
alias vu='vagrant up && vagrant ssh'
alias vs='vagrant ssh'
alias vd='vagrant halt'

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
