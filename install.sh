#!/bin/sh

INSTALL_DIR="${INSTALL_DIR:-$HOME/repos/github.com/detteiu8383/dotfiles}"

if [ -d "$INSTALL_DIR" ]; then
  echo "updating dotfiles..."
  git -C "$INSTALL_DIR" pull
else
  echo "Installing dotfiles..."
  git clone https://github.com/detteiu8383/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.bash"
