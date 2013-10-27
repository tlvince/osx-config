#!/bin/sh

_have() { command -v "$1" >/dev/null; }

_have "brew" || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew update
brew install git zsh tree htop-osx tmux hub
brew install vim --disable-nls --without-ruby

brew tap tlvince/homebrew-tlvince
brew install tlvince/tlvince/mutt --HEAD --mua \
  --with-confirm-attachment-patch \
  --with-confirm-crypt-hook-patch \
  --with-pgp-verbose-mime-patch
