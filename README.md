# Nextcloud with Docker
docker-compose for nextcloud fpm with mariadb and nginx proxy as well as self signed ssl

### Before running
1) Update password in [db.env](db.env) and root password in [docker-compose.yml](docker-compose.yml) (default: password123)
2) Update domain in [docker-compose.yml](docker-compose.yml) (default: 127.0.0.1)
3) Update volume path in [docker-compose.yml](docker-compose.yml) (default: /var/nextcloud)
4) Update max upload size in [proxy/uploadsize.conf](proxy/uploadsize.conf) and [web/nginx.conf](web/nginx.conf) (default: 25 GB)

### Running
Make sure docker volume paths exist in the host sytem. If default configuration is used directory tree can be created with the following command:
```bash
mkdir -p /var/nextcloud/{db,data,certs,vhost,html}
```

Running containers:
```bash
docker-compose build --pull
docker-compose up -d
```

#### Runing custom script
[Custom script](app/docker-entrypoint-custom.sh) is automatically copied to app container image. It can be run by executing:
```bash
docker-compose exec --user www-data app docker-entrypoint-custom
```

### Updating
```bash
docker-compose down
```
And repeat steps for running.
