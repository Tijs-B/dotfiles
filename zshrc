# Allow local customizations in the ~/.shell_local file
if [ -f ~/.shell_local ]; then
    source ~/.shell_local
fi

# Aliases
source ~/.shell/aliases.sh

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"


. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"
