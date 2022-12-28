#!/bin/sh

INSTALL_DIR="${INSTALL_DIR:-$HOME/repos/github.com/detteiu8383/dotfiles}"

if [ -d "$INSTALL_DIR" ]; then
  echo "\e[1m\e[35m[dotfiles]\e[0m Updating dotfiles..."
  git -C "$INSTALL_DIR" pull
else
  echo "\e[1m\e[35m[dotfiles]\e[0m Installing dotfiles..."
  git clone https://github.com/detteiu8383/dotfiles "$INSTALL_DIR"
fi

/bin/bash "$INSTALL_DIR/scripts/setup.bash"
