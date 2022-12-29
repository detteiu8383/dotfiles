#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

echo "$DOTFILES_PREFIX setup symbolic links..."

if [ ! -d "$HOME/.ssh" ]; then
  mkdir -p "$HOME/.ssh"
  chmod 700 "$HOME/.ssh"
fi

mkdir -p \
  "$XDG_CONFIG_HOME" \
  "$XDG_STATE_HOME" \
  "$XDG_DATA_HOME/vim"

ln -sfv "$REPO_DIR/config/"* "$XDG_CONFIG_HOME"
ln -sfv "$XDG_CONFIG_HOME/zsh/.zshenv" "$HOME/.zshenv"

if [ -d "$HOME/.gitmoji" ]; then
  rm -rf "$HOME/.gitmoji"
fi
ln -sfv "$XDG_CONFIG_HOME/gitmoji" "$HOME/.gitmoji"

ln -sfnv "$XDG_CONFIG_HOME/vim" "$HOME/.vim"
