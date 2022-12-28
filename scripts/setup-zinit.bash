#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

if [ -d "$XDG_DATA_HOME/zinit/bin" ]; then
  echo "\e[1m\e[35m[dotfiles]\e[0m zinit is already installed."
  git -C "$XDG_DATA_HOME/zinit/bin" pull
else
  echo "\e[1m\e[35m[dotfiles]\e[0m Installing zinit..."
  git clone "https://github.com/zdharma-continuum/zinit" "$XDG_DATA_HOME/zinit/bin"
fi
