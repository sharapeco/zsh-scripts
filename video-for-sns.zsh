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

# 動画を小さいサイズ (30fps, 720p) に変換する
function video-size-reduce() {
	help() {
		echo 'Usage: video-size-reduce input'
		echo '  foo.mp4 -> foo-reduced.mp4'
	}
	if [ "$1" = "" ]; then
		help
		return
	fi

	local filter="format=yuv420p"

	local fps=`video-get-fps "${1}"`
	case ${fps} in
		"50" )
			filter="${filter}, fps=25"
		;;
		"59.94" )
			filter="${filter}, fps=29.97"
		;;
		"60" )
			filter="${filter}, fps=30"
		;;
		"100" )
			filter="${filter}, fps=25"
		;;
		"119.88" )
			filter="${filter}, fps=29.97"
		;;
		"120" )
			filter="${filter}, fps=30"
		;;
	esac

	ffmpeg \
		-i "${1}" \
		-filter:v ${filter} \
		-s 1280x720 \
		"${1:r}-reduced.mp4"

	local original_size=`wc -c < "${1}"`
	local reduced_size=`wc -c < "${1:r}-reduced.mp4"`
	printf "ORIGINAL: %'d bytes ===> REDUCED: %'d bytes\n" ${original_size} ${reduced_size}
}

# 動画のフレームレートを取得する
function video-get-fps() {
	ffmpeg -i "${1}" 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"
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
