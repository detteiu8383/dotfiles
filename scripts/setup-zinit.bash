#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

if [ -d "$XDG_DATA_HOME/zinit/bin" ]; then
  echo "$DOTFILES_PREFIX zinit is already installed."
  git -C "$XDG_DATA_HOME/zinit/bin" pull
else
  echo "$DOTFILES_PREFIX Installing zinit..."
  git clone "https://github.com/zdharma-continuum/zinit" "$XDG_DATA_HOME/zinit/bin"
fi
