#!/bin/bash
echo "  O $0"

echo "    * Get vim"
sudo apt-get install vim

echo "    * Linking .vimrc"
ln -sb ~/bootstrap/ubuntu/vim/.vimrc ~/.

