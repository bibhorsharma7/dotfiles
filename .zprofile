if [[ -z $TMUX ]]; then
  if uwsm check may-start; then
    exec uwsm start hyprland.desktop
  fi
fi
