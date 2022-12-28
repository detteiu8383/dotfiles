#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

command -v apt >/dev/null || exit 0
[ -n "$SKIP_APT" ] && exit

echo "$DOTFILES_PREFIX setup apt..."

sudo -E /bin/sh "$REPO_DIR/config/apt/install.sh"
