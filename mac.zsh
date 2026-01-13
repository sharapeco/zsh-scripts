### macOS 固有の設定

# rm で削除のかわりにゴミ箱に移動する
if type trash > /dev/null 2>&1; then
	alias rm='trash -F'
fi

# スリープと復帰のログを表示する
alias sleep-log="/usr/bin/pmset -g log | rg '\b(Sleep|(Dark)?Wake) {3,}'"

# Safari で URL を開く
alias safari='open -a Safari'

# CotEditor で開く
alias cot='open -a CotEditor'

# 出力をクリップボードにコピー
#
# % command arg | C
# ...Shift キーを押したまま打てるのがポイント
alias C='pbcopy'
