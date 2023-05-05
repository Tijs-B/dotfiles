path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.dotfiles/bin"

if command -v pyenv &> /dev/null
then
    eval "$(pyenv init -)"
fi

