# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="sorin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git autojump docker)

source $HOME/.cargo/env

# User configuration
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/scripts
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

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# export PATH="$(brew --prefix php56)/bin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=/usr/local/lib/python3.6/site-packages/:$PATH

alias lbg='source $BASE16_LIGHT_SHELL'
alias dbg='source $BASE16_DARK_SHELL'
alias s='source ~/.zshrc'
alias vim='nvim'
alias vi='nvim'
alias server='python -m SimpleHTTPServer'
alias weather='curl -4 wttr.in'
alias chromeless='open -a "Google Chrome" -n --args "--app=http://localhost:8080"'
alias subl='/Applications/Sublime\ Text.app/Contents/MacOS/Sublime\ Text'

alias rand-str='env LC_CTYPE=C tr -dc "a-zA-Z0-9-_\$\?" < /dev/urandom | head -c 64'
alias list='du -sh ./* | gsort -h'
alias vu='vagrant up'
alias vd='vagrant halt'
alias json='python -m json.tool'
alias untar='tar -xvf'
alias rand='openssl rand -hex 8'
alias tvs='tmux split-window -h'
alias tsp='tmux split-window -v'
alias ta='tmux attach'
alias td='tmux detach'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

dsh() { docker exec -it $(docker ps -aqf "name=$1") sh; }
dri()   { docker rmi $(docker images -q); }
drm()   { docker rm $(docker ps -a -q); }
dstop() { docker stop $(docker ps -a -q); }

env2var() { export $(cat $1 | xargs) }

alias gbb='git checkout $(git branch | fzf)'
alias update-retail='heroku run python manage.py addstores'
alias npmo="npm --cache-min 9999999 "
alias c='cd $(ls | fzf)'

export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://gist.github.com/hlissner/db74d23fc00bed81ff62
search_replace() {
    ag -l $1 | xargs sed -i '' "s/$1/$2/g"
}
alias sr='search_replace'

search_do() {
    ag -l $1 | xargs sed -i '' "$2"
}
alias sd='search_do'
