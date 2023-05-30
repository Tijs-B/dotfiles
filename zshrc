# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Allow local customizations in the ~/.shell_local file
if [ -f ~/.shell_local ]; then
    source ~/.shell_local
fi

# Functions
source ~/.shell/functions.sh

# Plugins before
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

# Bootstrap
source ~/.shell/bootstrap.sh

# Prompt
source ~/.zsh/prompt.zsh

# Aliases
source ~/.shell/aliases.sh

# Plugins after
source ~/.zsh/plugins_after.zsh


