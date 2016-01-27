# Antigen
source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
git
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
EOBUNDLES
antigen theme kardan
antigen apply

# Options
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
zstyle ':completion:*' rehash true

# Bindings
bindkey OA history-beginning-search-backward
bindkey OB history-beginning-search-forward


# alias
alias git='TZ=UTC git'
alias exit='if [[ $? == 0 ]]; then; exit; fi'
