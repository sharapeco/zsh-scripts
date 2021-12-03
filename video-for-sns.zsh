## SNS 向けに動画を変換する
## See: https://qiita.com/mollifier/items/eba71bc33bb7e3b76233

# Twitter 向けに動画を変換する
function video-for-twitter() {
	help() {
		echo 'video-for-twitter'
		echo 'Usage: video-for-twitter input output'
	}
	if [ "$2" = "" ]; then
		help
		return
	fi
	ffmpeg \
		-i $1 \
		-c:v libx264 \
		-c:a aac \
		-vf fps=30 \
		-vf format=yuv420p \
		$2
}

# Twitter 向けに動画を変換する（音声なし）
function video-for-twitter-no-audio() {
	help() {
		echo 'video-for-twitter-no-audio'
		echo 'Usage: video-for-twitter-no-audio input output'
	}
	if [ "$2" = "" ]; then
		help
		return
	fi
	ffmpeg \
		-i $1 \
		-c:v libx264 \
		-an \
		-vf fps=30 \
		-vf format=yuv420p \
		$2
}
