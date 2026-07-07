# kitty

[Kitty](https://sw.kovidgoyal.net/kitty/) terminal configuration.

Primary terminal. Uses kitty's built-in tab/split management instead of tmux.

## Highlights

- Font: **Sarasa Term K** 15px
- Nerd Font symbols mapped to **JetBrainsMono Nerd Font**
- Active theme include: `themes/github_light.conf`
- Additional themes under `.config/kitty/themes/`
- Background opacity: 100%, blur enabled
- macOS `option` key mapped as `Alt` for Neovim compatibility
- Layouts: `splits`, `stack`
- Custom tab bar settings and `tab_bar.py`

## Key Bindings

| Key | Action |
|-----|--------|
| `Cmd+d` | Vertical split |
| `Cmd+Shift+d` | Horizontal split |
| `Alt+x` | Close window |
| `Alt+Cmd+h/j/k/l` | Move between splits |
| `Cmd+Ctrl+←/↓/↑/→` | Resize split |
| `Cmd+t` | New tab with current working directory |
| `Alt+n` / `Alt+p` | Next / previous tab |
