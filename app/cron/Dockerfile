FROM nextcloud:fpm-alpine

USER root

# Change cron.php execution from every 5 min to 1 hour
# Cron jobs are located in /etc/crontabs/www-data
RUN sed -i -e "s/\*\/5/0/g" /etc/crontabs/www-data
