#!/bin/bash

#Build executable using pkg@4.4.9

echo "Creating build folder"

build_folder=`pwd`/system_diagnose_backend

mkdir -p $build_folder

echo "Installing node packages"
npm install

echo "buid exe"
pkg . -t node10 -o systemdiagnosticbackend

echo "Build sdb Docker Image"

docker build -t systemdiagnosticbackend:1 .

echo "Saving docker image"

docker save -o sdb.tar systemdiagnosticbackend:1

chmod 777 sdb.tar

echo "copy sdb.tar to build folder"

mv sdb.tar $build_folder

cp start.sh $build_folder

echo "tar system_diagnose_backend"

tar -zcvf system_diagnose_backend.tar ./system_diagnose_backend

echo "Setting permissions"
chmod -R 777 $build_folder
chown -R allgovision:allgovision $build_folder

echo "Build process completed"