### エイリアス
###
### zsh では alias -g とすると global alias となる
### Global alias はコマンドの途中でも機能する

# ファイル操作
alias ls='ls -vG'
alias ll='lsd -l'
alias la='ls -AvG'
alias lla='lsd -al'
alias mkdir='mkdir -p'
alias vi=vim
alias df='df -h'
alias du='du -h'
alias du1='du -hd1'
alias xargs-i='xargs -I "{}"'

# Git
alias gico='git commit -am'

# preg-rename
alias pren='php ~/.config/zsh/pren.php'

# 打ち間違い対策
alias bar=bat

# mkdir && cd
function mkcd() {
	dir="$*";
	mkdir -p "$dir" && cd "$dir";
}
