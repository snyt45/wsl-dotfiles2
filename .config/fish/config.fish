# this file executes after /conf.d

# ~/bin
if test -d $HOME/bin
  set -x PATH $HOME/bin $PATH
end

# alias
alias lg='lazygit'
alias ld='lazydocker'

# starship
eval (starship init fish)
