FROM nextcloud:fpm-alpine

USER root

# Tune PHP-FPM
# Settings recommended for 4 GB RAM and 1 GB of MySQL cache
RUN sed -i -e "s/pm\.max_children = .*/pm.max_children = 120/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i -e "s/pm\.start_servers = .*/pm.start_servers = 12/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i -e "s/pm\.min_spare_servers = .*/pm.min_spare_servers = 6/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i -e "s/pm\.max_spare_servers = .*/pm.max_spare_servers = 18/g" /usr/local/etc/php-fpm.d/www.conf

# copy custom scripts
RUN mkdir /scripts
ADD scripts/* /scripts/
RUN \
    chmod +x /scripts/*; \
    chown -R www-data:www-data /scripts;
