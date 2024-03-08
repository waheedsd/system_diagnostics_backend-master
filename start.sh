#!/bin/bash

#check docker If already exist remove docker container, image
if [ -f sdb.tar ]; then
  docker stop sdb
  docker rm sdb
  docker rmi systemdiagnosticbackend:1
else
  echo "sdb docker not found"
fi


#load docker image
docker load -i sdb.tar

# # Run docker container
docker run -d \
  --network host \
  -e "TZ=$(timedatectl | grep Time | awk '{print $3}')" \
  -v /etc/localtime:/etc/localtime:ro \
  --restart unless-stopped \
  --mount type=bind,source=$HOME/system_diagnostic,target=/home/allgovision/system_diagnostic \
  --user=$(id -u):$(id -g) \
  --name sdb \
  systemdiagnosticbackend:1