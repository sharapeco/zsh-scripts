# .ppk を .pem に変換する
function ppk-to-pem() {
	help() {
		echo 'ppk-to-pem – Putty の秘密鍵ファイル .ppk を OpenSSH の .pem 形式に変換する'
		echo 'Usage: ppk-to-pem key.ppk'
		echo ''
		echo ' - key.pem を出力します'
		return
	}

	if (( $# == 0 ))
	then help; fi

	for arg in $*
	do
		case $arg in
			-h|--help)
				help
				return
				;;
			*)
				puttygen $1 -O private-openssh -o ${1:r}.pem
				echo "=> ${1:r}.pem"
				return
		esac
	done
	return 1;
}

_ppk-to-pem-cmd() {
	_arguments \
		'(- *)'{-h,--help}'[Show help]' \
		'*: :->files'

	case $state in
		files)
			_files -g "*.ppk"
			;;
	esac
}

compdef _ppk-to-pem-cmd ppk-to-pem
