docker compose down;
docker volume rm -f apache_server_data apache_database_data;
docker compose up --force-recreate --no-deps --build --no-start server;
docker compose up;