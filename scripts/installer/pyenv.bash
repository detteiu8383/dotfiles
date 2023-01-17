#!/usr/bin/env bash

if (type "pyenv" > /dev/null 2>&1); then
  echo "pyenv is already installed."
else
  curl https://pyenv.run | bash
fi
