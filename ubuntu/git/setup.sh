#!/bin/bash
# Installs and configures git 
#
echo "  O $0"

echo "    * Install git-core"
sudo apt-get install -y git-core

if [ -z "$GIT_USERNAME" ]; then
    read -p "Enter your git user name: " GIT_USERNAME
    echo "# Created by $0" >> ~/.bash_profile
    echo "export GIT_USERNAME=$GIT_USERNAME" >> ~/.bash_profile
fi

if [ -z "$GIT_EMAIL ]; then
    read -p "Enter your git email: " GIT_EMAIL
    echo "# Created by $0 " >> ~/.bash_profile
    echo "export GIT_EMAIL=$GIT_EMAIL" >> ~/.bash_profile
fi

echo "    * git config"
git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL
git config --list

