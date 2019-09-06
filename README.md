# Docker-PHP
PHP-FPM docker image with the most common extensions. 

<a href="https://travis-ci.org/iSerter/docker-php"><img src="https://travis-ci.org/iSerter/docker-php.svg?branch=master" alt="Build Status"></a>

- PHP 7.3.6
- Xdebug
- Bcmath, Ctype, Gettext, Iconv, Mbstring, Intl, GD, imagick, imap, ldap, 
- MySQL, PostgreSQL, Sqlite, MongoDB,  Redis, Memcached 
- SOAP, Sockets, Tokenizer, Zip, Zlib
- and more. 

### Pull the image
``` 
docker pull iserter/php-fpm 
```

### Use in docker-compose.yml
```
version: '3'
services:
  php:
    container_name: php
    image: iserter/php-fpm
```