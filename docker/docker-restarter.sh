#!/bin/bash

# Author: AMBROSINI Loïc
# Email: contact@crazyball.fr

CONTAINER=$1

RUNNING=$(docker inspect --format="{{ .State.Running }}" $CONTAINER 2> /dev/null)

if [ $? -eq 1 ]; then
  echo "UNKNOWN - $CONTAINER does not exist."
  exit 3
fi

if [ "$RUNNING" == "false" ]; then
  echo "NOT RUNNING - restarting $CONTAINER"
  docker-compose restart
else
  echo "RUNNING"
fi
