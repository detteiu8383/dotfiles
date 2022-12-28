#!/usr/bin/env bash
set -x
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

[ -n "$SKIP_HOMEBREW" ] && exit

if type brew >/dev/null; then
    echo "\e[1m\e[35m[dotfiles]\e[0m Homebrew is already installed."
else
    echo "\e[1m\e[35m[dotfiles]\e[0m Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.profile"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "\e[1m\e[35m[dotfiles]\e[0m Updating Homebrew..."
brew update

echo "\e[1m\e[35m[dotfiles]\e[0m Installing Homebrew apps..."
brew bundle install --file "${REPO_DIR}/config/homebrew/Brewfile" --no-lock --verbose

true