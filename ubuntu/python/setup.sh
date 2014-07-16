#!/bin/bash
#
# Synopsis:  Install and configure Python environment
#
echo "  O $0"

echo "    `python --version`"

echo "    * Install pip"
sudo apt-get install python-pip

echo "    * oauth2"
sudo pip install oauth2
