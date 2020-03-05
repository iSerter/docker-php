# Docker-PHP
A PHP-FPM docker image with the most common dependencies & extensions. 

<a href="https://travis-ci.org/iSerter/docker-php"><img src="https://travis-ci.org/iSerter/docker-php.svg?branch=master" alt="Build Status"></a>

- PHP 7.4.3 
- Xdebug
- Bcmath, Ctype, Gettext, Iconv, Mbstring, Intl, GD, imagick, imap, 
- MySQL, PostgreSQL, Sqlite, MongoDB,  Redis, Memcached 
- SOAP, Sockets, Tokenizer, Zip, Zlib, OpCache
- Supervisor, and more. 

(See branch `php73` for PHP 7.3)

### Pull the image
``` 
docker pull iserter/php-fpm:7.4
```

### Use in docker-compose.yml
```
version: '3'
services:
  php-fpm:
    container_name: php-fpm
    image: iserter/php-fpm:7.4
```


# 
Build an image from Dockerfile in the current directory
```$xslt
docker build -t iserter-php:7.4 .
```

Tag a local image with a new image name and tag
```$xslt
docker tag iserter-php:7.4 iserter/php-fpm:7.4 
```

Push an image to a registry 
```$xslt
docker push iserter/php-fpm:7.4
```
