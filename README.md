# Nextcloud with Docker
docker-compose for nextcloud fpm with mariadb and nginx proxy as well as self signed ssl

### Before running
1) Update password in db.env and docker-compose.yml (password123)
2) Update domain in docker-compose.yml (127.0.0.1)
3) Update volume path in docker-compose.yml (/var/nextcloud)
4) Update max upload size in proxy/uploadsize.conf and web/nginx.conf (25 GB)

#### Custom setup script
Custom setup script is automatically copied to app container image. It can be run by executing:
```bash
docker-compose exec --user www-data app custom_setup
```

### Running
```bash
docker-compose build --pull
docker-compose up -d
```

### Updating
```bash
docker-compose down
```
And repeat steps for running.
