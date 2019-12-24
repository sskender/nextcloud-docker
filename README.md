# Nextcloud with Docker
docker-compose for nextcloud fpm with mariadb and nginx proxy as well as self signed ssl

### Getting started
Folders for mounting data must be created, read below how to do that. Next, copy all .env.example files to only .env extension and then edit each one with your settings.

#### WARNING
MariaDB and PHP-FPM are configured to run on server with 1 CPU (4 threads) and 16 GB of RAM. If your configuration differs, edit database configuration [my.cnf](db/my.cnf) and php configuration [Dockerfile](app/Dockerfile) files. There is no general rule for performance tweaking so look for explanations elsewhere. In /var/pool is a huge BTRFS raid disk pool mounted on my server.

### Before running
Values that are ought to be changed before running:
1) Update database passwords in [db.env](env/db.env.example) (*default: password123*)
2) Update domains in [nginx.env](env/nginx.env.example) (*default: 127.0.0.1*)
3) Update ssl certificates to match your domain name in [sslcert.env](env/sslcert.env.example) (*default: 127.0.0.1*)
4) Update volume paths for each service in [docker-compose.yml](docker-compose.yml) (*default: /var/pool/nextcloud*)
5) Update max upload size in [proxy/uploadsize.conf](proxy/uploadsize.conf) and [web/nginx.conf](web/nginx.conf) (*default: 25 GB*)

### Running
Make sure docker volume paths exist in the host sytem. If the default configuration is used, a directory tree can be created with the following commands:
```bash
mkdir -p /var/pool/nextcloud/{db,data,certs,vhost,html,mail}
mkdir -p /var/ramdisk/{dbcache,rediscache}
```

Mount free ram as ramdisk for caching:
```bash
sudo mount -t tmpfs -o size=2048M tmpfs /var/ramdisk/dbcache
sudo mount -t tmpfs -o size=2048M tmpfs /var/ramdisk/rediscache
```

Save ramdisks to fstab file:
```bash
none /var/ramdisk/dbcache tmpfs nodev,nosuid,noexec,nodiratime,size=2048M 0 0
none /var/ramdisk/rediscache tmpfs nodev,nosuid,noexec,nodiratime,size=2048M 0 0
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

### Troubleshooting

Problems I ran into:

##### Redis
Verify redis is being used:
```bash
docker-compose exec --user root redis redis-cli MONITOR
```

##### Trusted domains
Sometimes trusted domains are not picked up in app image. Peek in this file to verify:
```bash
docker-compose exec --user www-data app cat config/config.php
```
