# ZQLZ

ZQLZ settings and the Vesper theme, using `Vesper` in dark mode.

```sh
cd ~/dotfiles
stow --ignore='^README\.md$' zqlz
```

Back up existing files before stowing. Runtime databases, connections, logs, and workspace sessions stay outside this package. Keep `editor.ai_api_key` empty in tracked settings.

The theme is copied from `zed/.config/zed/themes/vesper.json` so this package can be used independently.
