#!/bin/bash
echo 'Start init'

if [ -z ${ROOT_PASSWORD} ]; then
	echo "Use default password : root"
	echo "root:root" | chpasswd
else
	echo "root:${ROOT_PASSWORD}" | chpasswd
fi
if [ ! -d /opt/sarah/server ]; then
	cd /opt
	git clone https://github.com/JpEncausse/SARAH-Server-NodeJS.git sarah
	cd /opt/sarah/server/app
	npm install
	mkdir data
	cp server/server.prop data/custom.prop
fi

cd /opt/sarah
export NODE_PATH=/opt/sarah/server/app/node_modules
sudo -E node /opt/sarah/server/app/app.js