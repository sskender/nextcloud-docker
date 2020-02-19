#!/bin/sh

# Add overwrite protocol to config array (fix log in loop).
#
# See more at:
# https://docs.nextcloud.com/server/12/admin_manual/configuration_server/reverse_proxy_configuration.html
sed -i "/$CONFIG = array (/a \ \ 'overwriteprotocol' => 'https'," /var/www/html/config/config.php
