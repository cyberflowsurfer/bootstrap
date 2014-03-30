#!/bin/bash
#
# Synopsis:  Install and configure Rails development environment
# More info: https://www.digitalocean.com/community/articles/how-to-install-ruby-on-rails-on-ubuntu-12-04-lts-precise-pangolin-with-rvm
#
echo "  O =$0"
RUBY_VERSION=ruby
RUBY_VERSION= ruby-1.9.3-p545
RAILS_VERSION=3.1.0
RAILS_GEMS=(cucumber)
RVM_URL=https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer 

echo "    * Install required packages"
sudo apt-get install build-essential git-core

if [ -d ~/.rvm/ ]; then
    echo "    * RVM already installed"
else
    echo "    * Fetch RVM from ($RVM_URL)"
    bash -s stable < <(curl -s $RVM_URL)
    echo "      - Update .bash_profile"
    echo "# Added by bootstrap/ubuntu/rails/setup.sh" >> ~/.bash_profile
    echo '[[ -s "~/.rvm/scripts/rvm" ]] && source "~/.rvm/scripts/rvm"' >> ~/.bash_profile
    source ~/.rvm/scripts/rvm
    echo "      - Installed RVM `rvm --version`"
fi

rvm requirements

echo "    * Use ruby: $RUBY_VERSION"
rvm install $RUBY_VERSION
rvm use --default $RUBY_VERSION

echo "    * Have RVM update gems"
rvm rubygems current

echo "    * Install rails: $RAILS_VERSION"
sudo gem install rails -v $RAILS_VERSION

echo "    * Install gems"
for i in "${RAILS_GEMS[@]}"
do
  echo "      - Installing gem: $i"
  sudo gem install $i
done


