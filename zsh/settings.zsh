# Initialize completion
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=4
zmodload zsh/complist

# Make shift-tab navigate completions in reverse
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Use vim style navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory
setopt HIST_IGNORE_SPACE

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms

# Use vim as the editor
export EDITOR=vim

# Use vim style line editing in zsh
bindkey -v
# Movement
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'G' end-of-buffer-or-history
# Undo
bindkey -a 'u' undo
bindkey -a '^R' redo
# Edit line
bindkey -a '^V' edit-command-line
# Backspace
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Use incremental search
bindkey "^R" history-incremental-search-backward

# Disable shell builtins
disable r

