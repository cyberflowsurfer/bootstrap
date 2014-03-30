#!/bin/bash
#
# Synopsis: Installs Heroku tools and initializes access
#
echo "  O "

echo "    * Install Heroku toolbelt"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

echo "    * Login and generate keys"
heroku login
ssh-keygen -t rsa
heroku keys:add

