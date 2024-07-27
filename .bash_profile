username=$(whoami)
echo "Hello $username"
exprot COURSE_ID="__REPO_NAME__"


if [ -e "$HOME/.token" ]; then

    token_permissions=$(stat -c "%a" "$HOME/.token")
    if [ "$token_permissions" -ne 600 ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi


umask 006

export PATH="$PATH:/home/$username/usercommands"
date -u +"%Y-%m-%dT%H:%M:%S+00:00"

alias ltxt='ls *.txt'

TMP_DIR="$HOME/tmp"

if [ ! -d "$TMP_DIR" ]; then

    mkdir "$TMP_DIR"
else
    rm -rf "$TMP_DIR"/*
fi
fuser -k 8080 -tcp 2>/dev/null
