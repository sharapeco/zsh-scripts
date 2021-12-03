### プロンプトの設定

# PROMPT変数内で変数参照
setopt prompt_subst

# バージョン管理システムから情報を取得
# http://www.sirochro.com/note/terminal-zsh-prompt-customize/
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true #formats 設定項目で %c,%u が使用可
zstyle ':vcs_info:git:*' stagedstr "%F{green}!" #commit されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{yellow}+" #add されていないファイルがある
zstyle ':vcs_info:*' formats "%F{242}%c%u%b%f" #通常
zstyle ':vcs_info:*' actionformats '[%b|%a]' #rebase 途中,merge コンフリクト等 formats 外の表示

precmd () { vcs_info }

# 色の設定は %{ ... %} の中に書く（カーソルが変な動きをしないため）
# %B 太字の始まり
# %b 太字の終わり
# %F{...} 色を指定
# %f 色をリセット
PROMPT=$'
%{%B%F{031}%}%~%{%b%f%} ${vcs_info_msg_0_}
%{%B%F{031}%}%#%{%b%f%} '
