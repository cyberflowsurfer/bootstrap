#!/bin/bash

# Create develop branch 
git checkout -b develop
git push -u origin develop

# create staging branch
git checkout -b staging
git push -u origin staging

exit 0
