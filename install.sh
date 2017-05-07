#!/bin/bash
PROXY_BIN="/usr/local/bin/cloud_sql_proxy"
PROXY_NAME="cloud_sql_proxy"
INIT_SCRIPT="/etc/init.d/cloud_sql_proxy"
ARCH_TYPE=`uname -m`

echo "-- Download the proxy"
wget https://dl.google.com/cloudsql/$PROXY_NAME.linux.amd64
echo "-- Move the proxy to user bin folder"
mv $PROXY_NAME.linux.amd64 $PROXY_BIN
echo "-- Make the proxy executable"
chmod +x $PROXY_BIN

# Init proxy connection at boot
cp ./init./cloud_sql_proxy $INIT_SCRIPT
update-rc.d cloud_sql_proxy defaults