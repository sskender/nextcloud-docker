#!/bin/bash

sed -i "/$CONFIG = array (/a \ \ 'overwriteprotocol' => 'https'," config/config.php