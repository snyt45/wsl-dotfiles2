# this file executes after /conf.d

# ~/bin
if test -d $HOME/bin
  set -x PATH $HOME/bin $PATH
end

# alias
alias lg='lazygit'
alias ld='lazydocker'

# Linuxbrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# starship
eval (starship init fish)
