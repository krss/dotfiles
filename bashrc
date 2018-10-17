##########
# Aliases
##########

alias la='ls -la'
alias ll='ls -l'
alias popd='popd > /dev/null'
alias stmux="~/dotfiles/tmuxdev.sh"
alias tma="tmux attach"

alias dotfiles='pushd ~/dotfiles > /dev/null'
alias vimrc='vim ~/.vimrc'
alias vman='vim_manual'

alias httpserv=$'tmux rename-window "http ($(pwd | grep -o \'/[^/]*$\'))" 2> /dev/null && python3 -m http.server'
##########
# Scripts
##########

function vim_manual() {
    vim <(man $1)
}
function outpipe() {
    echo $(pwd):$@ > ~/.tmp/outpipe
    echo $@ > ~/.tmp/outpipe2
}

##########
# Settings
##########

alias ls='ls --color=auto'
alias rspec='rspec --color'

##########
# Sources
##########
if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi

if [ -f ~/dotfiles/shell/bash_prompt.sh ]; then
    source ~/dotfiles/shell/bash_prompt.sh
fi

COLORS="$HOME/dotfiles/shell/base16-shell/base16-eighties.dark.sh"
if [ -f $COLORS ]; then
    $COLORS
fi
