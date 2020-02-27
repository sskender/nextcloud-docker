FROM nextcloud:fpm-alpine

USER root

# Editing cron jobs located in /var/spool/cron/crontabs

# Change cron.php execution from every 5 min to 1 hour
RUN sed -i -e "s/\*\/5/\*\/15/g" /var/spool/cron/crontabs/www-data

# Add cron job for gallery preview generator app
# that runs every 12 hours (twice a day)
RUN echo "0 */12 * * * php /var/www/html/occ preview:pre-generate" >> /var/spool/cron/crontabs/www-data
