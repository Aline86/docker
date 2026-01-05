#!/bin/bash
set -e

echo "Waiting for MySQL to be available..."
until mysqladmin ping -h "localhost" --silent; do
    sleep 1
done

echo "Running schema from init.sql..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" < /docker-entrypoint-initdb.d/init.sql

echo "Running inline SQL insert..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
USE \`$MYSQL_DATABASE\`;

INSERT INTO \`user\` (\`id\`, \`email\`, \`password\`, \`token\`, \`connection_attempts\`)
VALUES (NULL, '$USER_EMAIL', '$USER_PASSWORD', '', 0);
EOSQL
