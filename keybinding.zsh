# キーバインドをリセット
bindkey -d

# Emacs キーバインドを有効にする
bindkey -e

## ----------------------------------
## 以下は Karabiner-Elements と組み合わせて使うことを想定

# ESC b, ESC f で単語単位でカーソル移動
#bindkey "\ef" forward-word
#bindkey "\eb" backward-word

# Undo/Redo
#bindkey "^_" undo
bindkey "^X^U" redo

# 単語単位の移動で / を単語に含めない
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
