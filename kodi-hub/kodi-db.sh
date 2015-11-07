#!/bin/bash

# This script starts the database server.
echo "Creating user $user"

# Create kodi user with write access
/usr/sbin/mysqld &
sleep 5
echo "Creating user"
echo "CREATE USER '$user' IDENTIFIED BY '$password'" | mysql --default-character-set=utf8
echo "REVOKE ALL PRIVILEGES ON *.* FROM '$user'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "GRANT SELECT ON *.* TO '$user'@'%'; FLUSH PRIVILEGES" | mysql --default-character-set=utf8
echo "GRANT ALL PRIVILEGES ON *.* TO '$user'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql --default-character-set=utf8

# And we restart the server to go operational
mysqladmin shutdown
echo "Starting MySQL Server"
/usr/sbin/mysqld
