#!/bin/sh

z="/usr/local/etc/profile.d/z.sh"
[ -f "$z" ] && { source "$z"; alias j="z"; }
source "$HOME/.osx/vendor/chriskempson/base16-shell/base16-eighties.dark.sh"
