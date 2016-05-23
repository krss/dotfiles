# Set colors
inputcolor='[0;37m'
cwdcolor='[0;34m'
gitcolor=
gitcolorclean='[1;31m'
gitcolorchanges='[1;93m'
usercolor='[0;35m'

# get current git branch name and check if directory is dirty
function git_status {
    export gitstatus=[$(git rev-parse --abbrev-ref HEAD 2>/dev/null)]
    #Hide branch if not in git folder
    if [ "$?" -ne 0 ]; then
        gitstatus=''
    elif [[ "${gitstatus}" == "[]" ]]; then
        gitstatus=''
    else
        #if in git folder set color if there are uncommited changes
        if [ "$(git status --porcelain 2> /dev/null | tail -n1)" != "" ]; then
            gitcolor=$gitcolorchanges
        else
            gitcolor=$gitcolorclean
        fi
    fi

}

PROMPT_COMMAND="git_status; history -a; $PROMPT_COMMAND"
export PS1='\[\e${usercolor}\][\u@\h]\[\e${gitcolor}\]${gitstatus}\[\e${cwdcolor}\][\w]\[\e${inputcolor}\] $ '
