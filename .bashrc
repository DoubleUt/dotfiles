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
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/opt/texinfo/bin:$PATH
export PATH=/usr/local/bin:$PATH

# GHQ
export GHQ_ROOT=$HOME/src

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Rust
source ~/.cargo/env
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# Emacs
source ~/.emacs.d/settings.sh

# Alias
# ======
alias g='git'

alias la='ls -a'
# alias ll='ls -l'
alias ll='exa -aghHl --git'
alias p='cd ~/Projects/$(ls ~/Projects | fzf)'

alias t='tmux'
alias ta='tmux attach'

alias ghci='stack ghci'
alias ghc='stack ghc --'
alias runghc='stack runghc --'

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

# Completion
# ======

bind "set completion-ignore-case on"
bind "set show-all-if-unmodified on"

# bash completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion"
fi

# git completion
if [ -f "$(brew --prefix)/opt/git/etc/bash_completion.d/git-prompt.sh" ]; then
    source "$(brew --prefix)/opt/git/etc/bash_completion.d/git-prompt.sh"
fi

# npm
if hash npm 2>/dev/null; then
    source <(npm completion)
fi
