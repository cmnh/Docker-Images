FROM php:5.6-apache 
MAINTAINER Joel Marchewka "marchewkaj@carnegiemnh.org" version 1.00

# this need to stay the same for script to work
ENV HTTPD_USER www-data

COPY ./php.ini /usr/local/etc/php
RUN docker-php-ext-install mysqli

COPY ./localapache2-run.sh /
RUN chmod 755 /localapache2-run.sh

RUN ["/localapache2-run.sh"] 
