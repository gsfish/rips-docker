FROM php:7.2-apache

ENV APACHE_DOCUMENT_ROOT /rips
ENV RIPS_TARGET /target
ENV RIPS_VERSION 0.55

WORKDIR /tmp

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf \
    && mkdir -p ${APACHE_DOCUMENT_ROOT} $RIPS_TARGET \
    && apt-get update \
    && apt-get install -y wget unzip \
    && wget https://downloads.sourceforge.net/project/rips-scanner/rips-$RIPS_VERSION.zip \
    && unzip rips-${RIPS_VERSION}.zip \
    && mv rips-${RIPS_VERSION}/* ${APACHE_DOCUMENT_ROOT} \
    && sed -ri -e 's!BASEDIR!"'${RIPS_TARGET}'"!g' ${APACHE_DOCUMENT_ROOT}/index.php \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

WORKDIR ${APACHE_DOCUMENT_ROOT}
