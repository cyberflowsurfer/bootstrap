#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core


NVM_DIR="$HOME/.nvm"

if [ -d "$NVM_DIR" ]; then
  echo "=> NVM is already installed in $NVM_DIR, trying to update"
  echo -ne "\r=> "
  cd $NVM_DIR && git pull
else
  # Cloning to $NVM_DIR
  git clone https://github.com/creationix/nvm.git $NVM_DIR  
fi

echo

# Detect profile file, .bash_profile has precedence over .profile
if [ ! -z "$1" ]; then
  PROFILE="$1"
else
  if [ -f "$HOME/.bash_profile" ]; then
	PROFILE="$HOME/.bash_profile"
  elif [ -f "$HOME/.profile" ]; then
	PROFILE="$HOME/.profile"
  fi
fi

SOURCE_STR="[[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh"  # This loads NVM"

if [ -z "$PROFILE" ] || [ ! -f "$PROFILE" ] ; then
  if [ -z $PROFILE ]; then
	echo "=> Profile not found. Tried $HOME/.bash_profile and $HOME/.profile"
  else
	echo "=> Profile $PROFILE not found"
  fi
  echo "=> Run this script again after running the following:"
  echo
  echo "\ttouch $HOME/.profile"
  echo
  echo "-- OR --"
  echo
  echo "=> Append the following line to the correct file yourself"
  echo
  echo "\t$SOURCE_STR"
  echo
  echo "=> Close and reopen your terminal afterwards to start using NVM"
  exit
fi

if ! grep -qc 'nvm.sh' $PROFILE; then
  echo "=> Appending source string to $PROFILE"
  echo "# Added by bootstrap/ubuntu/node.sh" >> "$PROFILE"
  echo $SOURCE_STR >> "$PROFILE"
else
  echo "=> Source string already in $PROFILE"
fi

echo "=> Close and reopen your terminal to start using NVM"

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

