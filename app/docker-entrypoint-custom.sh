#!/bin/sh

# add overwrite protocol to config array
# desktop clients not working otherwise (log in loop)
# see more at:
# https://docs.nextcloud.com/server/12/admin_manual/configuration_server/reverse_proxy_configuration.html
sed -i "/$CONFIG = array (/a \ \ 'overwriteprotocol' => 'https'," /var/www/html/config/config.php
