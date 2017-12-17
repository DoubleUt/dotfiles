export LANG=ja_JP.UTF-8

# ls color
export LSCOLORS=gxfxcxdxbxegedabagacad

# Homebrew
export PATH=/usr/local/bin:$PATH

# Cask
export PATH="$HOME/.cask/bin:$PATH"

# Go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# Rust
source ~/.cargo/env
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# GHQ
export GHQ_ROOT=~/src
