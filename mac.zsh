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

# Time Machine バックアップから除外
function tmexclude() {
	local rules=('^node_modules$' '^__pycache__$')

	if [[ $1 == "sim" ]]; then
		echo "🕔 Time Machine バックアップから次のパスを除外します"
		for rule in $rules; do
			fd --hidden --no-ignore --type d --prune "$rule"
		done
		return
	fi

	if [[ $1 == "run" ]]; then
		for rule in $rules; do
			fd --hidden --no-ignore --type d --prune "$rule" -x tmutil addexclusion {}
		done
		echo "🕔 Time Machine バックアップの除外設定を追加しました"
		return
	fi

	echo "🕔 tmexclude – Time Machine バックアップから特定のパスを除外"
	echo "Usage: tmexclude <sim|run>"
	echo ""
	echo " sim – 除外されるパスをシミュレーション表示"
	echo " run – 除外を実行"
	echo ""
	echo "カレントディレクトリ以下の次のパスを除外します:"
	for rule in $rules; do
		echo "  - $rule"
	done
	return 1
}
