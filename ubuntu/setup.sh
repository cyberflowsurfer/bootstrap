#~/bin/bash
#
# Synopsis: Invokes setup scripts for core components
#
echo "-----------------------------------------------------------------------"
echo "ubuntu/setup.sh"
echo "-----------------------------------------------------------------------"

# Set execute permission for all nested setup.sh files 
find . -name "setup.sh" -exec chmod +x {} \;

# Install core components
~/bootstrap/ubuntu/bash/setup.sh
~/bootstrap/ubuntu/git/setup.sh
~/bootstrap/ubuntu/screen/setup.sh
echo "  O Done"
echo
echo "      To set up other components execute the setup.sh script in the corresponding"
echo "      directory"

