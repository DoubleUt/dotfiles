# Homebrew
set -x PATH /usr/local/bin $PATH
set -x PATH $PATH /usr/local/opt/texinfo/bin

# GHQ
set -x GHQ_ROOT $HOME/src
alias g='cd (ghq root)/(ghq list | fzf)'

# Emacs
set -x PATH $PATH $HOME/.cask/bin
alias e='emacsclient -t -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
alias em='emacs &'

# tmux
alias t='tmux'
alias ta='tmux attach'

# Rust
source ~/.cargo/env
set -x RUST_SRC_PATH "(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Haskell
alias ghci='stack ghci'
alias ghc='stack ghc --'
alias runghc='stack runghc --'

# prefer ls comments
alias l='exa -aghHl --git'
