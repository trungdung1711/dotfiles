# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Lines configured by zsh-newuser-install
# zun's history configuration
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# History options
setopt APPEND_HISTORY         # Append to the history file (don't overwrite it)
setopt INC_APPEND_HISTORY     # Add commands as they are typed, not at shell exit
setopt SHARE_HISTORY          # Share history across all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first
setopt HIST_IGNORE_DUPS       # Don’t record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Delete old recorded entry if new entry is a duplicate
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording entry

# Key binding just like vim
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/zun/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# XDG environment variables
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_STATE_HOME="$HOME/.local/state"

# Adding Go's binary to $PATH
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Pluggins from github (installed by zinit)
# Prompt
# zinit light romkatv/powerlevel10k

# Plugin: Suggestions while typing
zinit light zsh-users/zsh-autosuggestions

# Plugin: Syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Plugin: Extra completion support
zinit light zsh-users/zsh-completions

# Plugin: Suggest commands you should use more
zinit light MichaelAquilina/zsh-you-should-use

# Plugin: Add sudo to previous commands (OMZ)
# zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh

# Plugin: Add web search to the shell (OMZ)
# zinit ice svn
# zinit snippet OMZP::web-search

# Plugin: Add copy directory
# zinit snippet OMZP::copydir

# Plugin: Add fzf for command completion
zinit light Aloxaf/fzf-tab

# Plugin: Add vim key binding and vim behavior to Zsh
zinit light jeffreytse/zsh-vi-mode

# Plugin: Add git plugin (OMZ)
# zinit snippet OMZP::git
zinit snippet OMZL::git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

# Plugin: Command not found
zinit snippet OMZP::command-not-found

# Plugin: Add OMZ fuzzy search in history
zinit load 'zsh-users/zsh-history-substring-search'
zinit ice wait atload'_history_substring_search_config'
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# MY COMMAND
# 1. TO ENABLE THE MENU WHEN CHOOSING
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# 2. ALLOW direnv to manage environment variables
# eval "$(direnv hook zsh)"


# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add my own binary directory to $PATH
export PATH="$HOME/mybin:$PATH"


# Central local repository 
# export CONDA_ENVS_PATH="/mnt/window_storage/arch-linux/miniforge3/envs"
# export CONDA_PKGS_DIRS="/mnt/window_storage/arch-linux/miniforge3/pkgs"
# export CONDARC="/mnt/window_storage/arch-linux/miniforge3/.condarc"
# export HF_HOME="/mnt/window_storage/arch-linux/huggingface/"

. "$HOME/.local/bin/env"
# To enable fzf within zsh
source <(fzf --zsh)


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ENV VAR
export EDITOR="nvim"

# zocide
eval "$(zoxide init zsh --cmd cd)"
# starship
eval "$(starship init zsh)"
