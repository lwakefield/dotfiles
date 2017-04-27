# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="sorin"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git autojump kubectl laravel5)

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
# BASE16_SHELL="$HOME/.config/base16-shell/scripts/base16-tomorrow-night.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# export PATH="$(brew --prefix php56)/bin:$PATH"
export PATH=$HOME/.composer/vendor/bin:$PATH

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
alias vu='vagrant up'
alias vd='vagrant halt'
alias json='python -m json.tool'
alias untar='tar -xvf'
alias kc='kubectl'
alias kcd='kubectl describe'
alias kcg='kubectl get'
alias kcc='kubectl create'

alias dm='docker-machine'
alias dmc='docker-machine create --driver xhyve'

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

# https://robots.thoughtbot.com/cding-to-frequently-used-directories-in-zsh
tagcomplete() {
  if (( CURRENT == 2 )); then
    compadd $(cut -f 1 .git/tags tmp/tags tags 2>/dev/null | grep -v '!_TAG')
  fi
}
# compdef tagcomplete ag
# compdef tagcomplete sr

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/lawrence/Downloads/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/lawrence/Downloads/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/lawrence/Downloads/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/lawrence/Downloads/google-cloud-sdk/completion.zsh.inc'
fi
