# dotfiles

Terminal setup — green-on-black "terminal pur" stack on elementary OS 8 (Ubuntu 24.04 base).

## Stack

- **Ghostty** — terminal emulator. Launches tmux on start.
- **tmux** — outer multiplexer, prefix `Ctrl+a`.
- **herdr** — inner session manager (one dedicated tmux window), prefix `Ctrl+b`.
- **Taskwarrior 3.x** — task management, integrated into the tmux status bar.

## Layout

```
.tmux.conf                     tmux: panes, copy-mode, herdr window, Taskwarrior binds
.taskrc                        Taskwarrior: dark-green theme, FR holidays, reports
.config/tmux/task-status.sh    status-bar segment: ✓<pending> ⏰<due-today>
.config/ghostty/config         Ghostty: theme, font, tmux autostart
.config/ghostty/tmux-start.sh  attach-or-create tmux session "main"
.config/ghostty/herdr-start.sh herdr-everywhere fallback
.config/herdr/config.toml      herdr: theme + keys mirroring tmux
```

## Install

Tracked files live under `home/` (the stow package). Symlink into `$HOME`
with GNU stow (paths in `.taskrc` / ghostty are absolute for `leoinnocenzi`):

```bash
git clone git@github.com:leryud/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --no-folding -t ~ home
```

`--no-folding` = per-file symlinks, real dirs kept (so other files in
`~/.config/ghostty`, `~/.config/herdr` stay untouched).

Taskwarrior 3.x is built from source → `~/.local/bin/task` (not committed; data lives in `~/.local/share/task/`).

## Taskwarrior keybinds (in tmux)

| Key | Action |
|-----|--------|
| `Ctrl+a` `a` | Quick-add task (inline prompt) |
| `Ctrl+a` `T` | Task popup (interactive) |
| click `✓N` | Task popup |
