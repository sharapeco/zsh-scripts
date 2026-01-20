### いろいろな初期設定

# カラフルにしたい
autoload colors && colors

# これがないと補完機能が有効にならないってほんと？
autoload -Uz compinit && compinit

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1

### 履歴の設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history
 
# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups
 
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
 
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# ディレクトリ名で cd
setopt auto_cd

# かんたんリネーム
#
# % zmv foo-*.txt bar-*.txt
#
# foo-1.txt foo-2.txt foo-3.txt
# => bar-1.txt bar-2.txt bar-3.txt
autoload -Uz zmv
alias zmv='noglob zmv -W'

# VS Code のターミナルで Emacs キーバインドを有効にする
bindkey -e
