if [ ! -p .outpipe ]; then
    mkfifo ~/.outpipe
fi

while true; do
    sh -c "$(cat ~/.outpipe)"
done
