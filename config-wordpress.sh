#!/bin/bash

# set logs folder
logs_file_path=/var/www/logs
mkdir $logs_file_path
chgrp www-data $logs_file_path
chmod 765 $logs_file_path # 7(Owner: full) - 6(Group: write, read) - 5(Public: execute, read)

# config WordPress
if ! $(wp core is-installed  --allow-root --path='/var/www/html'); then
   echo "=> WordPress is not configured yet, configuring WordPress ..."

    wp core install\
        --path=/var/www/html\
        --url=$WP_URL\
        --title=$WP_TITLE\
        --admin_user=$WP_ADMIN_USER\
        --admin_password=$WP_ADMIN_PASSWORD\
        --admin_email=$WP_ADMIN_EMAIL\
        --allow-root

else
   echo "=> WordPress is already configured.";
fi

#end of line must be linux type LF, if is windows CRLF this error will thrown: "Syntax error: end of file unexpected (expecting "then")"