## PDF の操作に関するもの

# 埋め込みフォントをアウトライン化する
function pdf-outlinize() {
	help() {
		echo 'pdf-outlinize'
		echo 'Usage: pdf-outlinize input'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi
	output="${1%.*}-outline.pdf"
	gs -o $output -dNoOutputFonts -sDEVICE=pdfwrite $1
	echo ""
	echo "✨ $output"
}
