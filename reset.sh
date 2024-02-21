docker compose down;
docker volume rm -f enami-apache-php_server_data enami-apache-php_database_data;
docker compose up --force-recreate --no-deps --build --no-start server;
docker compose up --detach;
