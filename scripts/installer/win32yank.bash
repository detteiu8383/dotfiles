#!/usr/bin/env bash

if ! (type "win32yank.exe" > /dev/null 2>&1); then
  echo "win32yank.exe is not installed. Install win32yank.exe..."
  curl -sLo /tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
  unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
  chmod +x /tmp/win32yank.exe
  sudo mv /tmp/win32yank.exe /usr/local/bin/
  echo "Successfully installed win32yank.exe."
fi
