#!/bin/sh

# Change default preview settings.
#
# Following instructions from this blog:
# https://ownyourbits.com/2019/06/29/understanding-and-improving-nextcloud-previews/

echo "Changing previewgenerator app settings ..."
php /var/www/html/occ config:app:set previewgenerator squareSizes --value="32 256"
php /var/www/html/occ config:app:set previewgenerator widthSizes  --value="256 384"
php /var/www/html/occ config:app:set previewgenerator heightSizes --value="256"

echo "Changing system settings ..."
php /var/www/html/occ config:system:set preview_max_x --value 2048
php /var/www/html/occ config:system:set preview_max_y --value 2048
php /var/www/html/occ config:system:set jpeg_quality --value 60
php /var/www/html/occ config:app:set preview jpeg_quality --value="60"

echo "Generating previews for the first time ..."
sleep 5s
time php /var/www/html/occ preview:generate-all -vvv
echo "All done"
