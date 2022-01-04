#*******************************************************************************
#
# .bash_profile
#   ログイン時に一度だけ読み込まれる
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

# include .bashrc_custom if it exists
if [ -f "$HOME/.bashrc_custom" ]; then
    . "$HOME/.bashrc_custom"
fi
