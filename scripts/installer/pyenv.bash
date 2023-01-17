#!/usr/bin/env bash

if ! (type "pyenv" > /dev/null 2>&1); then
  curl https://pyenv.run | bash
fi
