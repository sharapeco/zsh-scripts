## このファイルのあるディレクトリ
local zsh_config_dir="$0:h"

## zsh の初期設定
source "$zsh_config_dir/init.zsh"
source "$zsh_config_dir/keybinding.zsh"

## 各種設定
source "$zsh_config_dir/aliases.zsh"
source "$zsh_config_dir/dev-fn.zsh"
source "$zsh_config_dir/prompt.zsh"
source "$zsh_config_dir/ssh.zsh"
source "$zsh_config_dir/mac.zsh"
source "$zsh_config_dir/emsdk.zsh"

## 便利なツール
source "$zsh_config_dir/pdf-utils.zsh"
source "$zsh_config_dir/video-for-sns.zsh"
source "$zsh_config_dir/web.zsh"
