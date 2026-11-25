# ── Key bindings ──────────────────────────────────────────────────────────────
# vi 모드. 아래 bindkey는 모두 viins(기본 keymap)에 적용된다.
bindkey -v
export KEYTIMEOUT=1

# vi 모드에서 사라지는 기본 편집 키를 되살린다.
bindkey '^?' backward-delete-char
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^w' backward-kill-word
bindkey '^u' backward-kill-line

# normal 모드는 블록, insert 모드는 막대 커서로 구분한다.
function _vi_cursor_shape() {
  case $KEYMAP in
    vicmd) print -n '\e[2 q' ;;
    *)     print -n '\e[6 q' ;;
  esac
}
function zle-keymap-select() { _vi_cursor_shape }
function zle-line-init() { zle -K viins; _vi_cursor_shape }
zle -N zle-keymap-select
zle -N zle-line-init
# 명령 실행 중에는 기본 커서로 돌려 둔다.
preexec_functions+=(_vi_cursor_reset)
function _vi_cursor_reset() { print -n '\e[2 q' }

# fzf's shell integration also binds Tab; let zsh-autocomplete own completion.
if (( $+widgets[down-line-or-select] )); then
  bindkey '^I' complete-word
fi

if (( $+widgets[autosuggest-accept] )); then
  bindkey '^ ' autosuggest-accept
  bindkey '^f' autosuggest-accept
fi

if (( $+widgets[history-substring-search-up] )); then
  bindkey '^p' history-substring-search-up
fi

if (( $+widgets[history-substring-search-down] )); then
  bindkey '^n' history-substring-search-down
fi
