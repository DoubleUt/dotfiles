# Environment
# ======

export LANG=ja_JP.UTF-8

# ls color
export LSCOLORS=gxfxcxdxbxegedabagacad

# less
#export LESS="-i -M -R -S"
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

# Homebrew
export PATH=/usr/local/opt/texinfo/bin:$PATH
export PATH=/usr/local/bin:$PATH

# Cask
export PATH="$HOME/.cask/bin:$PATH"

# GHQ
export GHQ_ROOT=$HOME/src

# Go
export GOPATH=$HOME/src
export PATH=$PATH:$GOPATH/bin

# Rust
source ~/.cargo/env
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Alias
# ======

alias ghci='stack ghci'
alias ghc='stack ghc --'
alias runghc='stack runghc --'

alias ll='exa -aghHl --git'
alias g='cd $(ghq root)/$(ghq list | fzf)'

alias t='tmux'
alias ta='tmux attach'

alias e='emacsclient -t -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
alias ew='emacs &'

alias la='ls -a'
# alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias sudo='sudo '

# Prompt
# ======

# git prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
