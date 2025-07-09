FROM php:8.1-apache

RUN apt-get update && apt-get install -y \
      libpng-dev libxml2-dev libzip-dev libicu-dev libonig-dev git unzip \
  && docker-php-ext-install intl mbstring pdo_mysql zip gd xml fileinfo

RUN a2enmod rewrite
RUN echo 'upload_max_filesize = 32M\npost_max_size = 32M' \
    > /usr/local/etc/php/conf.d/uploads.ini


COPY php-dev.ini /usr/local/etc/php/conf.d/zzz-opcache.ini

COPY ojs-system/ /var/www/html/

RUN chown -R www-data:www-data /var/www/html

CMD ["apache2-foreground"]
