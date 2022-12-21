#!/bin/sh -e
ubuntu_version="$(lsb_release -r | awk '{print $2 * 100}')"

add-apt-repository -y ppa:git-core/ppa
apt update
apt upgrade -y
apt install -y \
  bat \
  build-essential \
  direnv \
  fzf \
  git \
  git-lfs \
  gpg \
  jq \
  libssl-dev \
  neovim \
  python3 \
  python3-pip \
  python3-pynvim \
  shellcheck \
  tmux \
  unzip \
  wget \
  zip \
  zsh

curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | apt-key add -
