if [ ! -p .outpipe ]; then
    mkfifo ~/.outpipe
fi

if [ ! -p .outpipeDir ]; then
    mkfifo ~/.outpipeDir
fi

while true; do
    cd "$(cat ~/.outpipeDir)"
    cmd="$(cat ~/.outpipe)"
    echo
    echo
    echo `pwd` '$' $cmd
    bash -c $cmd
done
