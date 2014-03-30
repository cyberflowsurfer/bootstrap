#!/bin/bash
#
# Synopsis:  Configure screen multi-windowing
# More Info: https://www.digitalocean.com/community/articles/how-to-install-and-use-screen-on-an-ubuntu-cloud-server
#
echo "  O $0"

echo "    * Linking .screenrc"
ln -sb ~/bootstrap/ubuntou/screen/.screenrc ~/.

echo "    * `screen -v`"
