# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# ZSH_THEME="devops-zsh/senpai-long"
ZSH_THEME="spaceship"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-prompt zsh-syntax-highlighting history-substring-search docker helm vi-mode)

source $ZSH/oh-my-zsh.sh

# ---------------------
alias vim="nvim"

# ls after changing directory
chpwd() {
  ls -lah
}

# add gcloud completion
source /opt/google-cloud-sdk/completion.zsh.inc

# add pure-zsh async functions and custom_completions to fpath
fpath=(
  # "$HOME/.zfunctions"
  ~/.oh-my-zsh/custom_completions
  $fpath
)

# kubectl
source <(kubectl completion zsh)

#go
export GOPATH=$HOME/go

# Set the list of directories that Zsh searches for programs.
path=(
  ~/bin
  $GOPATH/bin
  ~/.local/bin
  /snap/bin/
  $path
)

# loading pure theme
# autoload -U promptinit; promptinit
# prompt spaceship
# source '/opt/kube-ps1/kube-ps1.sh'
# PROMPT='$(kube_ps1)'$PROMPT
# function get_cluster_short() {
#   echo "$1" | cut -d '_' -f4
# }

# KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

# loading completions
autoload -U compinit && compinit

# Add terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/terraform/terraform terraform

# helm aliases
alias hh="helm tiller run helm"
alias hr="helm tiller run"
alias ht="helm tiller start"
alias hts="helm tiller stop"

# docker aliases
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
alias dcu="docker-compose up"
alias dcud="docker-compose up -d"

# add direnv
eval "$(direnv hook zsh)"

# default editor
export EDITOR="nvim"