#!/bin/sh
alias ls='ls -hG'
alias o='open'
alias oo='open .'
alias oa='open -a'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and
# their installed packages
alias update='sudo softwareupdate -ia; brew update; brew upgrade; \
              brew cleanup; npm update npm -g; npm update -g; sudo gem update'
