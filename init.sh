#!/bin/sh

_have() { command -v "$1" >/dev/null; }

_have "brew" || ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# brew update

BREWS=".brew"
# Iterate so options are preserved
[ -f "$BREWS" ] && {
  while read -r formula; do
    brew install $formula
  done < "$BREWS"
}

_have "mutt" || {
  brew tap tlvince/homebrew-tlvince
  brew install tlvince/tlvince/mutt --HEAD --mua \
    --with-confirm-attachment-patch \
    --with-confirm-crypt-hook-patch \
    --with-pgp-verbose-mime-patch
}

_have "mpv" || {
  brew tap mpv-player/mpv
  brew install mpv --with-libquvi
}

brew cask >/dev/null 2>&1 || {
  brew tap phinze/homebrew-cask
  brew install brew-cask
}

CASKS=".cask"
[ -f "$CASKS" ] && brew cask install $(<"$CASKS")

_have "tlmgr" && {
  sudo tlmgr update --self --all
  LATEXES=".basictex"
  [ -f "$LATEXES" ] && sudo tlmgr install $(<"$LATEXES")
}
