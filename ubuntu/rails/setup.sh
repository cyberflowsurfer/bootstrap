#!/bin/bash
echo "-----------------------------------------------------------------------"
echo "rails/setup.sh"
echo "-----------------------------------------------------------------------"

sudo apt-get install build-essential git-core
bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
echo "# Added by bootstrap/ubuntu/rails/setup.sh" >> ~/.bash_profile
echo '[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"' >> ~/.bash_profile 
source ~/.bash_profile

type rvm | head -1
rvm install 1.9.3
rvm use --default 1.9.3

gem install rails -v 3.1.0
gem install cucumber


