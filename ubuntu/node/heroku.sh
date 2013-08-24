#!/bin/bash

wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

heroku login
ssh-keygen -t rsa
heroku keys.add

