ARG PHP_VERSION
ARG BUILD_MODE

FROM php:${PHP_VERSION}-apache AS base

RUN apt-get update && apt-get install -y libzip-dev && docker-php-ext-install zip mysqli
WORKDIR /var/www/html

FROM base AS apache-wordpress
ARG WORDPRESS_VERSION
RUN curl -o wordpress.tar.gz https://wordpress.org/wordpress-$WORDPRESS_VERSION.tar.gz;
RUN tar zx -f wordpress.tar.gz
RUN mv wordpress/* .
RUN rm -r wordpress wordpress.tar.gz

FROM base AS apache-no-content
COPY html .

FROM apache-${BUILD_MODE} AS final
RUN chown -R www-data: .;

EXPOSE 80 443