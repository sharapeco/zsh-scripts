## SNS 向けに動画を変換する
## See: https://qiita.com/mollifier/items/eba71bc33bb7e3b76233

# Twitter 向けに動画を変換する
function video-for-twitter() {
	help() {
		echo 'Usage: video-for-twitter input'
		echo '  foo.mp4 -> foo-twitter.mp4'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi
	ffmpeg \
		-i $1 \
		-c:v libx264 \
		-c:a aac \
		-vf fps=30 \
		-vf format=yuv420p \
		"${1:r}-twitter.mp4"
}

# Twitter 向けに動画を変換する（音声なし）
function video-for-twitter-no-audio() {
	help() {
		echo 'Usage: video-for-twitter-no-audio input'
		echo '  foo.mp4 -> foo-twitter-no-audio.mp4'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi
	ffmpeg \
		-i $1 \
		-c:v libx264 \
		-an \
		-vf fps=30 \
		-vf format=yuv420p \
		"${1:r}-twitter-no-audio.mp4"
}

# Alexa Skill の短い音声向けに音声を変換する
function audio-for-alexa() {
	help() {
		echo 'Usage: audio-for-alexa input'
		echo '  foo.m4a -> foo.mp3'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi
	ffmpeg \
		-i $1 \
		-ac 2 \
		-codec:a libmp3lame \
		-b:a 48k \
		-ar 16000 \
		"${1:r}.mp3"
}
