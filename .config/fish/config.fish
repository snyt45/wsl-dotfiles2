# this file executes after /conf.d

# Ensure fisherman and plugins are installed
if not test -f $HOME/.config/fish/functions/fisher.fish
  echo "==> Fisherman not found.  Installing."
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
  echo "==> 'fisher update'コマンドを実行してください"
end
