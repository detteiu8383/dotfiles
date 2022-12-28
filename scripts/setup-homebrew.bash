#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

[ -n "$SKIP_HOMEBREW" ] && exit

if type brew >/dev/null; then
    echo "$DOTFILES_PREFIX Homebrew is already installed."
else
    echo "$DOTFILES_PREFIX Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.profile"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo "$DOTFILES_PREFIX Updating Homebrew..."
brew update

echo "$DOTFILES_PREFIX Installing Homebrew apps..."
brew bundle install --file "${REPO_DIR}/config/homebrew/Brewfile" --no-lock --verbose

true