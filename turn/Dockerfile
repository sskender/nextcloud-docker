FROM instrumentisto/coturn:latest

RUN apk \
    --no-cache \
    --virtual \
    build-dependencies \
    add \
        openssl


COPY turnserver.conf /etc/coturn/turnserver.conf


# update auth secret
RUN sed -i "s/north/$(openssl rand -hex 32)/" /etc/coturn/turnserver.conf \
 && secret=$(grep 'static-auth-secret=' /etc/coturn/turnserver.conf | \
        cut -d'=' -f2) \
 && echo -e "\n\nNEW SECRET: $secret\n\n"


# replace old entrypoint
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["--log-file=stdout"]
