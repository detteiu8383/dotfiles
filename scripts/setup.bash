#!/usr/bin/env bash
set -eu
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/setup-apt.bash"
/bin/bash "$CUR_DIR/setup-homebrew.bash"
/bin/bash "$CUR_DIR/setup-nvim.bash"
/bin/bash "$CUR_DIR/setup-links.bash"
/bin/bash "$CUR_DIR/setup-zinit.bash"

echo "$DOTFILES_PREFIX setup finished."
echo "$DOTFILES_PREFIX To set the default shell to zsh, execute the following command:

which zsh | sudo tee -a /etc/shells
chsh -s \`which zsh\`
"