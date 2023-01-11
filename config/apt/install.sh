#!/bin/sh -e
ubuntu_version="$(lsb_release -r | awk '{print $2 * 100}')"

sudo -E add-apt-repository -y ppa:git-core/ppa
apt update
apt upgrade -y
apt install -y \
  build-essential \
  curl \
  file \
  git \
  zip

curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | apt-key add -
