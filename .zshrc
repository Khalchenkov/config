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

# zoxide
eval "$(zoxide init zsh --cmd cd)"

# fzf
eval "$(fzf --zsh)"
