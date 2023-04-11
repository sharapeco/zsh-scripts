## Web 関連のコマンド

# サイトを丸ごとダウンロードする
# cf. https://takabus.com/tips/218/
function web-get-all() {
	help() {
		echo 'サイトを丸ごとダウンロードする'
		echo ''
		echo 'Usage: web-get-all <URL>'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi
	wget --no-verbose \
		--continue --tries=1 --no-iri \
		--wait=10 --random-wait \
		--convert-links --backup-converted --page-requisites \
		--recursive --no-parent \
		"$1"
}
