#~/bin/bash
# Performs general purpose setup

echo "-----------------------------------------------------------------------"
echo "ubuntu/setup.sh"
echo "-----------------------------------------------------------------------"

~/bootstrap/ubuntu/bash/setup.sh

read -p "Enter your user name: " username
read -p "Enter your email address: " email

export USERNAME=$username
export EMAIL=$email

read -p "Initialize .bash_profile (y/n)? " yn
if [ "$yn" = "y" ]; then
  echo "# User identity (created by ubuntu/setup)" >> ~/.bash_profile
  echo "export USERNAME=" $username >> ~/.bash_profile
  echo "export EMAIL=" $email >> ~/.bash_profile
fi

~/bootstrap/ubuntu/git/setup.sh
~/bootstrap/ubuntu/screen/setup.sh

