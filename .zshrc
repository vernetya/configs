# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export CLICOLOR=1

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit


alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -a --color=auto'
alias gs='git status'

source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.config/zsh/zsh-ls-colors/lscolors.sh

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down
bindkey '\eOA' history-substring-search-up # or ^[OA
bindkey '\eOB' history-substring-search-down # or ^[OB
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
