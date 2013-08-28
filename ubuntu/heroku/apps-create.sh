#!/bin/bash
heroku apps:create $USERNAME-$1-stage --remote staging-heroku
heroku apps:create $USERNAME-$1       --remote production-heroku


