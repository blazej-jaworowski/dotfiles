# nvim
export EDITOR='nvim'
alias vim='nvim'

# cargo
source $HOME/.cargo/env

# zoxide
eval "$(zoxide init zsh)"
alias cd=z

# PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin

# aliases
alias hgrep="history | rg "

