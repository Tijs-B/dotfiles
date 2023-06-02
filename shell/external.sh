if command -v pyenv &> /dev/null
then
    eval "$(pyenv init -)"
fi

if [ -e $HOME/.cargo/env ]
then
    . $HOME/.cargo/env
fi

if command -v ngrok &>/dev/null; then
    eval "$(ngrok completion)"
fi

