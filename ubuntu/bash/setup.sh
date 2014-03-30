#!/bin/bash
#
# Synopsis: Initialize BASH environment
#
echo "  O ubuntu/bash/setup.sh"

echo "    * linking (.bash_profile, .bashrc, .bash_custm)"
ln -sb ~/bootstrap/ubuntu/bash/.bash_profile ~/.
ln -sb ~/bootstrap/ubuntu/bash/.bashrc ~/.
ln -sb ~/bootstrap/ubuntu/bash/.bashrc_custom ~/.
