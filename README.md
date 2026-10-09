# Config files

## Use stow
```
# Only link files and not directories
stow --no-folding .
```

## script
for tmux plugin manager
```mkdir -p ~/.config/tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm```

## Claude Code hooks
The tmux agent sidebar needs Claude Code hooks in `~/.claude/settings.json`.
After stow, add them with this command. It needs `jq`, and you can run it again safely.
```
tmux-agent-state --install
```

