# git

Git configuration.

| File | Description |
|------|-------------|
| `.gitconfig` | Global git config — user, delta pager, rebase pull, `zdiff3` conflict style |
| `.gitignore_global` | Global gitignore |
| `.config/git/hooks/commit-msg.example` | Optional global commit message hook example |
| `.config/commitlint/config.cjs` | commitlint configuration |

Uses [delta](https://github.com/dandavison/delta) as the diff pager with side-by-side view.

The global hooks path is set to `~/.config/git/hooks`.
