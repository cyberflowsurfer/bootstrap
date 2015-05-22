#~/bin/bash
#
# Synopsis: Invokes setup scripts for core components
#
echo "-----------------------------------------------------------------------"
echo "ubuntu/setup.sh"
echo "-----------------------------------------------------------------------"

sudo apt-get update
sudo apt-get upgrade

# Set execute permission for all nested setup.sh files
find . -name "setup.sh" -exec chmod +x {} \;

# Install core components
~/bootstrap/ubuntu/bash/setup.sh
~/bootstrap/ubuntu/git/setup.sh
~/bootstrap/ubuntu/screen/setup.sh

for arg in "$@"
do
  if [ -d "~bootstrap/ubuntu/$arg" ]; then
    ~/bootstrap/ubuntu/screen/setup.sh
  else
    echo "**** Error: component does not exist: $arg"
  fi
done

echo "  O Done "
echo
echo "      To set up other components execute the setup.sh script in the"
echo "      corresponding directory"
