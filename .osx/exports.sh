# XDG
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# Node (brewed)
export PATH="$PATH:/usr/local/share/npm/bin"

# Android SDK (brewed)
export ANDROID_HOME="/usr/local/opt/android-sdk"

# Karma
export CHROME_BIN="/Applications/Chromium.app/Contents/MacOS/Chromium"

# Pip
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
export PATH="$PATH:$HOME/Library/Python/3.5/bin"

# Local
export PATH="$HOME/bin:$PATH"

# tj/n
export N_PREFIX="$HOME/.local"
export PATH="$HOME/.local/bin:$PATH"

# https://github.com/Homebrew/homebrew-core/issues/14737#issuecomment-319797811
GPG_TTY=$(tty)
export GPG_TTY
