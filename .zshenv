# 環境変数
export LANG=ja_JP.UTF-8
export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.cask/bin:$PATH"

source ~/.cargo/env
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src
