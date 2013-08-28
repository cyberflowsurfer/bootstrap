#!/bin/bash
# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
echo "-----------------------------------------------------------------------"
echo "ubuntu/emacs/setup.sh"
echo "-----------------------------------------------------------------------"

sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d-old
fi

ln -sf ~/bootstrap/ubuntu/emacs/.emacs.d ~/.
