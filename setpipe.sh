#!/bin/bash
if [ ! -d ~/.tmp ]; then
    mkdir ~/.tmp
fi
if [ ! -p ~/.tmp/outpipe ]; then
    mkfifo ~/.tmp/outpipe
    mkfifo ~/.tmp/outpipe2
fi
shopt -s expand_aliases
while true; do
    #/home/krss/src/example:ls
    cmd="$(cat ~/.tmp/outpipe)"
    cd $(echo $cmd | cut -d":" -f1)
    echo $cmd
    echo
    echo $(pwd) '$' $(echo $cmd | cut -d":" -f2)
    source ~/.tmp/outpipe2
done
