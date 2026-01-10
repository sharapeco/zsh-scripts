### emsdk を設定
function emsdk() {
  # emcc コマンドが見つからないかチェック
  if ! command -v emcc &> /dev/null; then
    echo "⚙️ EMSDKが読み込まれていません。セットアップを開始します..."

    # スクリプトの存在を確認してから source
    if [ -f "$HOME/sensei/emsdk/emsdk_env.sh" ]; then
      # source実行時の出力を静かにしたい場合は &> /dev/null をつける
      source "$HOME/sensei/emsdk/emsdk_env.sh"
    else
      echo "🚨 エラー: ~/sensei/emsdk/emsdk_env.sh が見つかりません" >&2
      return 1
    fi
  fi

  # 本物の emcc コマンドを、引数（$@）をすべて引き継いで実行
  # 'command' をつけることで、関数自身を呼び出す無限ループを防ぐ
  #command emcc "$@"
}
