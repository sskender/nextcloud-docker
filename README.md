# Nextcloud with Docker
docker-compose for nextcloud fpm with mariadb and nginx proxy as well as self signed ssl

### Getting started
Copy all .env.example files to only .env and then edit each one with your settings.

### Before running
1) Update database passwords in [db.env](db.env.example) (*default: password123*)
2) Update domains in [nginx.env](nginx.env.example) (*default: 127.0.0.1*)
3) Update ssl certificates to match your domain name in [sslcert.env](sslcert.env.example) (*default: 127.0.0.1*)
4) Update volume paths for each service in [docker-compose.yml](docker-compose.yml) (*default: /var/pool/nextcloud*)
5) Update max upload size in [proxy/uploadsize.conf](proxy/uploadsize.conf) and [web/nginx.conf](web/nginx.conf) (*default: 25 GB*)

### Running
Make sure docker volume paths exist in the host sytem. If default configuration is used directory tree can be created with the following command:
```bash
mkdir -p /var/pool/nextcloud/{db,data,certs,vhost,html}
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
