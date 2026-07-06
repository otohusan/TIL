# Theme
theme = Abernathy

# General
term = xterm-256color
macos-titlebar-style = transparent
macos-titlebar-proxy-icon = hidden
macos-option-as-alt = true

# Font
font-family = "Nerd Font Mono"
font-size = 10
font-feature = -dlig

# Widndow
window-padding-x = 10
window-padding-y = 6
window-padding-balance = true
window-decoration = true
window-inherit-working-directory = true
window-subtitle = working-directory
unfocused-split-opacity = 0.7

# Animation
quick-terminal-animation-duration = 0.3

# Other
clipboard-read = allow
clipboard-write = allow
copy-on-select = false
confirm-close-surface = false

background-opacity = 0.85
background-blur-radius = 30
mouse-hide-while-typing

scrollback-limit = 100000

mouse-shift-capture = true

# -------------------------------------------------------------------
#  画面分割（Split）のキーバインド強化
# -------------------------------------------------------------------
# 現在の設定のままだと画面移動（goto_split）だけなので、
# キーボードだけで画面をサクサク分割・リサイズできるようにする
# Cmd + d : 右に分割 / Cmd + Shift + d : 下に分割
keybind = super+d=new_split:right
        keybind = super+shift+d=new_split:down

# Cmd + Ctrl + 矢印キー で、分割画面のサイズを微調整
keybind = super+ctrl+left=resize_split:left,10
keybind = super+ctrl+right=resize_split:right,10
keybind = super+ctrl+up=resize_split:up,10
keybind = super+ctrl+down=resize_split:down,10

macos-option-as-alt = left

keybind = global:cmd+space=toggle_quick_terminal

# -------------------------------------------------------------------
# Ghosttyのデフォルトの左右移動を解除して、Zellijにパススルーする
# -------------------------------------------------------------------
keybind = alt+left=unbind
keybind = alt+right=unbind

# Ghostty自体のタブを Option + Command + 左右矢印 で切り替える
keybind = super+alt+left=previous_tab
keybind = super+alt+right=next_tab
