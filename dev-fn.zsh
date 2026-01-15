### 開発に便利な関数群

# レビュー用にリモートブランチを取り込む
function ghrev() {
	if (( $# != 1 )); then
		echo "ghrev – GitHub のリモートブランチをレビュー用にローカルに取り込む"
		echo "Usage: ghrev <branch-name>"
		return 1
	fi

	local branch=$1

	git fetch
	git switch -c ${branch} --track origin/${branch}
}

# Let’s Entrypt 証明書を作成・更新する
function lets() {
	help() {
		echo 'lets – Let’s Entrypt 証明書を作成・更新する'
		echo 'Usage: lets domain'
		echo ''
		echo ' - ドメインの確認方法としてDNS-01チャレンジを使用します'
		echo ' - 証明書は /etc/letsencrypt/live/<domain> に作成されます'
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
				sudo certbot certonly \
					--manual \
					--domain $arg \
	  				--preferred-challenges dns
				return
		esac
	done
	return 1;
}

_letscmd() {
	_arguments \
		'(- *)'{-h,--help}'[Show help]' \
}

compdef _letscmd lets
