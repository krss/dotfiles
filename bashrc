##########
# Aliases
##########

alias stmux="~/dotfiles/tmuxdev.sh"
alias outpipe='echo clear > ~/.outpipe; echo $@ > ~/.outpipe'

##########
# Settings
##########

alias ls='ls --color=auto'

##########
# Sources
##########
if [ -f ~/.bash_local ]; then
    source ~/.bash_local
fi

COLORS="$HOME/dotfiles/shell/base16-shell/base16-eighties.dark.sh"
if [ -f $COLORS ]; then
    $COLORS
fi
