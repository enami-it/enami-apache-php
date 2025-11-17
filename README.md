## Enami Apache PHP

This folder provides `docker compose` files for a local deployment of an apache server with PHP.

**_Important_**:  
Before installation, create a `.env` file and structured as follows:

```sh
BUILD_MODE= # allowed values: "wordpress" (default), "no-content". If BUILD_MODE=no-content then content from folder "./html" is copied into /var/www/html (e.g. you can use this feature to import a Duplicator wordpress project)

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

## Server configuration

You can setup an AWS machine (`t3a.medium`) via:

```sh
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
git clone https://github.com/enami-it/enami-apache-php.git
mv enami-apache-php/ <NAME>
echo "NAME=<NAME>\nHOSTNAME=<HOSTNAME>" > <NAME>/.env
```

Finally, manually edit `server` name with `<NAME>-server`

## Troubleshoot

If you get "*The response is not a valid JSON response*" error message, SSH into running server container and execute the following:

```sh
chmod 755 .htaccess;
a2enmod rewrite;
```
