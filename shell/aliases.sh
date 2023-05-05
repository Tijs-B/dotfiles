# Use colors in coreutils utilties output
alias ls='ls --color=auto'
alias grep='grep --color'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'
alias sl='ls'

# Better defaults
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

# Docker compose aliases
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcl='docker compose logs -f'
alias dcp='docker compose pull'
alias dcr='docker compose restart'
alias dcb='docker compose build'

# Common commands
alias gs='git status'
alias gc='git commit -v'
alias gd='git diff'
alias ga='git add --all'
alias v='vim'

# Venv commands
alias venv='rm -rf ./venv && python3 -m venv venv && source ./venv/bin/activate'
alias vact='source ./venv/bin/activate'
alias pinstall='source ./venv/bin/activate && pip3 install -r requirements.txt'

# Misc
alias tldr='tldr --language en'

