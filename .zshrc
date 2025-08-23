# Oh My ZSH!
export ZSH="$HOME/.oh-my-zsh"

# random themes
ZSH_THEME_RANDOM_CANDIDATES=( cloud )
ZSH_THEME="random"

# plugins
plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# some more aliases
alias l='lsd --group-directories-first'
alias ll='lsd -l -a --group-directories-first'
alias la='lsd -a --group-directories-first'
alias exa='exa --long --all --group --icons --git'
alias ls='ls -CF'
alias grep='rg'
alias find='fd'
alias du='dust'
alias delta='delta --side-by-side --line-numbers --tabs=2'
alias diff='delta --side-by-side --line-numbers --tabs=2'
alias rmdir='rm -rf'
alias rd='rm -rf'
alias update='sudo apt update && sudo apt upgrade'
alias clr='clear'

# neofetch
alias neofetch='neofetch --config ~/.config/neofetch/cfgs/default.conf --ascii ~/.config/neofetch/logos/logo_default'
alias neoaggre='neofetch --config ~/.config/neofetch/cfgs/default.conf --ascii ~/.config/neofetch/logos/logo_aggre'
alias neosmall='neofetch --config ~/.config/neofetch/cfgs/small.conf --ascii ~/.config/neofetch/logos/logo_small'
neofetch

# path
export PATH="$HOME/.local/bin":$PATH

# golang path
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export PATH=$GOBIN:$PATH
export PATH="$GOPATH/lang/bin":$PATH

# cargo path
export PATH="$HOME/.cargo/bin":$PATH

# fzf
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' --color=fg:#d0d0d0,hl:#9830ff --color=fg+:#d0d0d0,bg+:#1f0c29,hl+:#ff21a2 --color=info:#f1ae6d,prompt:#9830ff,pointer:#00b7ff --color=marker:#ff21a2,spinner:#f1ae6d,header:#6375a9'

# editor
export EDITOR="nvim"

# bat
export BAT_THEME="DarkNeon"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# fzf
eval "$(fzf --zsh)"
