FROM php:7.4.3-fpm

LABEL maintainer="Ilyas Serter <info@ilyasserter.com>"

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    g++ \
    build-essential \
    supervisor \
    default-mysql-client \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    libmagickwand-dev \
    libbz2-dev \
    libc-client-dev \
    libcurl4-gnutls-dev \
    libedit-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libkrb5-dev \
    libldap2-dev \
    libmagickwand-dev \
    libmemcached-dev \
    libpq-dev \
    libreadline-dev \
    libxslt1-dev \
    libzip-dev \
    libonig-dev \
    libmcrypt-dev \
    libssl-dev \
    libsqlite3-dev \
    locales \
    locales-all \
    wget \
    zip \
    unzip \
    zlib1g-dev \
    jpegoptim optipng pngquant gifsicle webp


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Installing PHP extensions
RUN docker-php-ext-install -j$(nproc) \
    bcmath \
    bz2 \
    calendar \
    curl \
    exif \
    gettext \
    iconv \
    mbstring \
    mysqli \
    pcntl \
    phar \
    posix \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    soap \
    sockets \
    opcache \
    tokenizer \
    xmlrpc \
    xsl \
    && docker-php-ext-install zip \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install -j$(nproc) intl \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) imap \
    && pecl install redis && docker-php-ext-enable redis \
    && pecl install memcached && docker-php-ext-enable memcached \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install xdebug && docker-php-ext-enable xdebug


# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Clean up
RUN apt-get remove -y g++ wget \
    && apt-get autoremove --purge -y && apt-get autoclean -y && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

# Set locales
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8