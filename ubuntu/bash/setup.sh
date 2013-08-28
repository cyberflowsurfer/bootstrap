#!/bin/bash
#
# Bootstrap initialization for bash
# Run before setting up other components
echo "-----------------------------------------------------------------------"
echo "ubuntu/bash/setup.sh"
echo "-----------------------------------------------------------------------"

ln -sb ~/bootstrap/ubuntu/bash/.bash_profile ~/.
ln -sb ~/bootstrap/ubuntu/bash/.bashrc ~/.
ln -sb ~/bootstrap/ubuntu/bash/.bashrc_custom ~/.
