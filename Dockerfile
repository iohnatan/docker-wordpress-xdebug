FROM wordpress:latest

LABEL description="WordPress development environment with Xdebug and WP-CLI"

# Install xdebug
ENV XDEBUG_PORT 9000
RUN yes | pecl install xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/

# Install WP-CLI in the toolbox
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Add WP setup script
ADD config_wordpress.sh /config_wordpress.sh
RUN chmod 755 /*.sh

EXPOSE 9000
