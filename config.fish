set PATH $PATH usr/local/bin $HOME/scripts $HOME/.cargo/bin

[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

abbr vim "nvim"
abbr gc "git commit -v"
abbr gca "git commit -v --all"
abbr gco "git checkout"
abbr gcb "git checkout -b"
abbr gcm "git checkout master"
abbr ga "git add"
abbr gau "git add --update"
abbr gd "git diff"
abbr gds "git diff --staged"
abbr gf "git fetch"
abbr ggl "git pull origin (current_branch)"
abbr ggp "git push origin (current_branch)"
abbr glg "git log"
abbr gst "git status"
abbr json "python -m json.tool"
abbr ta "tmux attach"
abbr server "python -m SimpleHTTPServer"

alias daystamp "date +%Y%m%d"

function current_branch
    echo (git branch ^/dev/null | sed -n '/\* /s///p')
end
