# ZQLZ

ZQLZ settings and the Kanso theme, using `Kanso Ink` in dark mode.

```sh
cd ~/dotfiles
stow --ignore='^README\.md$' zqlz
```

Back up existing files before stowing. Runtime databases, connections, logs, and workspace sessions stay outside this package. Keep `editor.ai_api_key` empty in tracked settings.

The theme is copied from `zed/.config/zed/themes/kanso.json` so this package can be used independently.
