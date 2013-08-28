#!/bin/bash
echo "------------------------------------------------------------------------"
echo "git/setup.sh"
echo "------------------------------------------------------------------------"

if [ -n "$USERNAME" ] ;then
    echo "$USERNAME not set; run ubuntu/setup.sh"
    exit
fi

if [ -n "$EMAIL" ] ;then
    echo "$EMAIL not set; run ubuntu/setup.sh"
    exit
fi

git config --global user.name $USERNAME
git config --global user.email $EMAIL

