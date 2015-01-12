#!/bin/bash

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
image_id=""
container_id=""

while getopts "h?ic:" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    c)  container_id=$OPTARG
        ;;
    i)  image_id=$OPTARG
        ;;
    esac
done

shift $((OPTIND-1))

[ "$1" = "--" ] && shift

#echo "Container ID=$container_id, Leftovers: $@"
if [[ -z "$image_id" ]]; then
    
fi
#container_id=$(docker run -v /home/riyad:/home -d -P --name test image_id)
address=$(docker port $container_id 22)
port=$(docker port $container_id 22 | cut -d \: -f 2)
#port=arr[${#address[@]}-1]
#| cut -d \; -f 1

# Setup passwordless login
#cat .ssh/id_rsa.pub | sshpass -p nothingelsematters ssh root@localhost -p $port 'cat >> .ssh/authorized_keys'
sshpass -p nothingelsematters ssh root@localhost -p $port
#ssh root@localhost -p $port
