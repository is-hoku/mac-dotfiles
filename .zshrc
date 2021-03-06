# ~/.zshrc
alias ls='ls -G'
eval "$(starship init zsh)"

export PATH=~/mac-dotfiles/bin:$PATH
export GOPATH=~/go
export PATH="$GOPATH/bin:$PATH"

export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export LC_NUMERIC=ja_JP.UTF-8
export LC_TIME=ja_JP.UTF-8
export LC_COLLATE=ja_JP.UTF-8
export LC_MONETARY=ja_JP.UTF-8
export LC_MESSAGES=ja_JP.UTF-8
export LC_PAPER=ja_JP.UTF-8
export LC_NAME=ja_JP.UTF-8
export LC_ADDRESS=ja_JP.UTF-8
export LC_TELEPHONE=ja_JP.UTF-8
export LC_MEASUREMENT=ja_JP.UTF-8
export LC_IDENTIFICATION=ja_JP.UTF-8

fpath=(~/.zsh $fpath)
autoload -U compinit
compinit -u

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
