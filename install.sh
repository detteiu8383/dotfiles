#!/bin/sh

INSTALL_DIR="${INSTALL_DIR:-$HOME/repos/github.com/detteiu8383/dotfiles}"

DOTFILES_PREFIX="$(printf '\033[1;35m[dotfiles]\033[0m')"

if [ -d "$INSTALL_DIR" ]; then
  echo "$DOTFILES_PREFIX Updating dotfiles..."
  git -C "$INSTALL_DIR" pull
else
  echo "$DOTFILES_PREFIX Installing dotfiles..."
  git clone https://github.com/detteiu8383/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.bash"
