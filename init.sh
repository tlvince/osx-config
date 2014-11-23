#!/bin/sh

_have() { command -v "$1" >/dev/null; }

_have "brew" || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

BREWS=".brew"
# Iterate so options are preserved
[ -f "$BREWS" ] && {
  while read -r formula; do
    brew install $formula
  done < "$BREWS"
}

_have "mutt" || {
  brew tap tlvince/homebrew-tlvince
  brew install tlvince/tlvince/mutt --mua \
    --with-confirm-attachment-patch \
    --with-confirm-crypt-hook-patch \
    --with-pgp-verbose-mime-patch
}

_have "mpv" || {
  brew tap mpv-player/mpv
  brew install ffmpeg --with-openssl
  brew install --HEAD mpv-player/mpv/libass-ct
  brew install --HEAD mpv
}

_have "get_iplayer" || {
  brew tap dinkypumpkin/get_iplayer
  brew install rtmpdump atomicparsley id3v2 lame get_iplayer
}

brew cask >/dev/null 2>&1 || {
  brew install caskroom/cask/brew-cask
  brew tap caskroom/versions
}

CASKS=".cask"
[ -f "$CASKS" ] && brew cask install $(<"$CASKS")

_have "tlmgr" && {
  sudo tlmgr update --self --all
  LATEXES=".basictex"
  [ -f "$LATEXES" ] && sudo tlmgr install $(<"$LATEXES")
}

_have "pip" || sudo easy_install pip
PIPS=".pip"
sudo pip install $(<"$PIPS")

_have "gem" && {
  GEMS=".gem"
  sudo gem install $(<"$GEMS")
}
