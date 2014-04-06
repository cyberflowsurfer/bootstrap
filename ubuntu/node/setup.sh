#!/bin/bash
#
# Synopsis:  Install and configure NodeJS environment
# More info: https://github.com/creationix/nvm
#            https://www.digitalocean.com/community/articles/how-to-install-node-js-with-nvm-node-version-manager-on-a-vps
#
echo "  O $0"

NVM_DIR="$HOME/.nvm"
NODE_VERSION="0.10.13"

echo "    * Install NVM"
if [ -d "$NVM_DIR" ]; then
  echo "=> NVM is already installed in $NVM_DIR, trying to update"
  echo -ne "\r=> "
  cd $NVM_DIR && git pull
else
  # Cloning to $NVM_DIR
  git clone https://github.com/creationix/nvm.git $NVM_DIR  
fi

echo "    * Update profile to load nvm"
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
echo "      - Located bash profile: $PROFILE"
echo "      - Construct source string"
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

if ! grep -q 'nvm.sh' "$PROFILE"; then
  echo "      - Appending source string to $PROFILE"
  echo "# Added by bootstrap/ubuntu/node.sh" >> "$PROFILE"
  echo $SOURCE_STR >> "$PROFILE"
else
  echo "      - $PROFILE already sources nvm.sh"
fi
n
# Load nvm and install latest production node
echo "    * Load NVM"
source $HOME/.nvm/nvm.sh
nvm install $NODE_VERSION
nvm use v0.10.13

echo "    * Install npm"
sudo apt-get npm
echo "    * Install emacs jshint (http://jshint.com/)"
npm install -g jshint

echo "    * Install rlrwrap (http://nodejs.org/api/repl.html#repl_repl)"
sudo apt-get install -y rlwrap

npm install -g express 
