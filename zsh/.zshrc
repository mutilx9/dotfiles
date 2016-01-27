# Antigen
source ~/.antigen/antigen.zsh

antigen bundles <<EOBUNDLES
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
olivierverdier/zsh-git-prompt
EOBUNDLES
antigen apply

# Prompt
autoload -U colors && colors
PROMPT='%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[green]%}%m%{$reset_color%} %{$fg_bold[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_super_status)
%# '

# Options
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY EXTENDED_HISTORY
zstyle ':completion:*' rehash true

# Bindings
bindkey -v
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Shell env
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export KEYTIMEOUT=1
export ZSH_THEME_GIT_PROMPT_CACHE=1
export ZSH_THEME_GIT_PROMPT_PREFIX="on "
export ZSH_THEME_GIT_PROMPT_SEPARATOR="("
export ZSH_THEME_GIT_PROMPT_SUFFIX=")"

# alias
alias git='TZ=UTC git'
alias exit='if [[ $? == 0 ]]; then; exit; fi'
