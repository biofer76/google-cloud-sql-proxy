#!/bin/bash
PROXY_BIN="/usr/local/bin/cloud_sql_proxy"
PROXY_NAME="cloud_sql_proxy"
INIT_SCRIPT="/etc/init.d/cloud_sql_proxy"
PROXY_CONF="$HOME/.sql_proxy"
ARCH_TYPE=`uname -m`

cd "$(dirname "$0")"
echo "-- Download the proxy"
wget https://dl.google.com/cloudsql/$PROXY_NAME.linux.amd64 -O $PROXY_NAME.linux.amd64
echo "-- Move the proxy to user bin folder"
echo $PROXY_BIN
mv $PROXY_NAME.linux.amd64 $PROXY_BIN
echo "-- Make the proxy executable"
chmod +x $PROXY_BIN

# Init proxy connection at boot
echo "-- Copy init script file"
echo $INIT_SCRIPT
cp init/cloud_sql_proxy $INIT_SCRIPT

echo "-- Set proxy autostart after booting"
update-rc.d cloud_sql_proxy defaults

echo -e "
---------------------------------
-    CHECK CONFIGURATION FILE   -
---------------------------------
"
if [ -f "$PROXY_CONF" ]
then
	echo -e "$PROXY_CONF FOUND. 
    Check for updates"
else
	echo -e "Attention: $PROXY_CONF NOT FOUND!!!
    copy sample sql_proxy.config file to $HOME folder
    and add all required config data.
    "
    
fi
echo "---------------------------------"
echo "-- DONE!"