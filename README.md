## Enami Apache PHP

This folder provides `docker compose` files for a local deployment of an apache server with PHP.

**_Important_**:  
Before installation, create a `.env` file and structured as follows:

```sh
BUILD_MODE= # allowed values: "no-content" (default), "wordpress". If BUILD_MODE=no-content then content from folder "./html" is copied into /var/www/html (e.g. you can use this feature to import a Duplicator wordpress project)

MYSQL_COMMAND= # mysql container command
MYSQL_VERSION= # vanilla mysql version (https://hub.docker.com/_/mysql)

PHP_VERSION= # vanilla php version (https://hub.docker.com/_/php)
WORDPRESS_VERSION= # wordpress version (https://wordpress.org/download/releases/). BUILD_MODE env variable must be "wordpress".

APACHE_PORT= # apache2 server port-forward
```

Run `./reset.sh` to rebuild image configuration, and persistent local volume.  

Database configuration:
* Host: `database`
* DB name: `wordpress`
* User: `wordpress`
* Password: `wordpress`
