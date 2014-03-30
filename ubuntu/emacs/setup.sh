#!/bin/bash
# Synopsis:  Install and configures emacs
# More info: https://launchpad.net/~cassou/+archive/emacs
# 
echo "  O $0"

echo "    * get emacs"
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

if [ -d ~/.emacs.d/ ]; then
    echo "    * Save .emacs.d"
    mv ~/.emacs.d ~/.emacs.d-old
fi
echo "    * Link .emacs.d"
ln -sf ~/bootstrap/ubuntu/emacs/.emacs.d ~/.
