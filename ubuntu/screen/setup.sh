#!/bin/bash
echo "------------------------------------------------------------------------"
echo "ubuntu/screen/setup.sh"
echo "------------------------------------------------------------------------"

echo "Linking .screenrc"
ln -sb ~/bootstrap/ubuntou/screen/.screenrc ~/.

screen-v
