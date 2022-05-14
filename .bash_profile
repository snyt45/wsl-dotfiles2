#*******************************************************************************
#
# .bash_profile
#   ログインシェルとして起動時に一度だけ読み込まれる
#
#*******************************************************************************

# include .profile if it exists
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# include .bashrc_local if it exists
if [ -f "$HOME/.bashrc_local" ]; then
    . "$HOME/.bashrc_local"
fi
