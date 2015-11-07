#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	echo "Use default password : root"
	echo "root:root" | chpasswd
else
	echo "root:${ROOT_PASSWORD}" | chpasswd
fi

cd /opt/sarah
export NODE_PATH=$PWD/server/app/node_modules
sudo -E node server/app/app.js