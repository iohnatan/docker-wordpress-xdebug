FROM wordpress:latest

LABEL description="WordPress development environment with Xdebug"

ENV XDEBUG_PORT 9000

RUN yes | pecl install xdebug

COPY xdebug.ini /usr/local/etc/php/conf.d/

EXPOSE 9000