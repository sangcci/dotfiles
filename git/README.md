# git

Git configuration.

| File | Description |
|------|-------------|
| `.gitconfig` | Global git config — user, delta pager, rebase pull, `zdiff3` conflict style |
| `.gitignore_global` | Global gitignore |
| `.config/git/hooks/commit-msg` | Global commit message hook |
| `.config/commitlint/config.cjs` | commitlint configuration |

Uses [delta](https://github.com/dandavison/delta) as the diff pager with side-by-side view.

The global hooks path is set to `~/.config/git/hooks`.
