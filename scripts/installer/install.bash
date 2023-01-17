#!/usr/bin/env bash
# shellcheck source=./scripts/common.bash
source "$(dirname "$0")/common.bash"

/bin/bash "$CUR_DIR/installer/pyenv.bash"
/bin/bash "$CUR_DIR/installer/win32yank.bash"
