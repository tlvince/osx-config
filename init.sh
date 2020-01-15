#!/bin/sh

_have() { command -v "$1" >/dev/null; }

_have "brew" || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

BREWS=".brew"
[ -f "$BREWS" ] && brew install $(<"$BREWS")

_have "mpv" || {
  brew tap mpv-player/mpv
  brew install ffmpeg
  brew install --HEAD mpv-player/mpv/libass-ct
  brew install --HEAD mpv
}

_have "get_iplayer" || {
  brew tap dinkypumpkin/get_iplayer
  brew install rtmpdump atomicparsley id3v2 lame get_iplayer
}

CASKS=".cask"
[ -f "$CASKS" ] && brew cask install $(<"$CASKS")

_have "tlmgr" && {
  sudo tlmgr update --self --all
  LATEXES=".basictex"
  [ -f "$LATEXES" ] && sudo tlmgr install $(<"$LATEXES")
}

_have "pip3" && {
  PIPS=".pip"
  pip3 install --user $(<"$PIPS")
}
