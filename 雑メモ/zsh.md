# 1. zsh-autocomplete (リアルタイム補完)
# source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# 2. zsh-autosuggestions (履歴からのヒント)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# 3. 基本の補完設定 (zsh-completions用)
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

eval "$(mise activate zsh)"

# zoxide の初期化（cd を zoxide にエイリアスする）
eval "$(zoxide init zsh)"

eval "$(fzf --zsh)"

# 検索用コマンドに fd を指定
FZF_DEFAULT_COMMAND='
  { fd --type d --hidden --follow --exclude .git --exclude node_modules;
    fd --type f --hidden --follow --exclude .git --exclude node_modules; }
'
# Ctrl-T (デフォルトのファイル検索) にも fd を適用
FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Zellij との競合回避
# fzf の Ctrl-T を解除して Ctrl-F に変更
bindkey -r '^T'
bindkey '^F' fzf-file-widget
