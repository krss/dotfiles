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
