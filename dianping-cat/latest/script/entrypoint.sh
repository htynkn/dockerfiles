#!/usr/bin/env bash

RESULT=`mysqlshow -u ${DATABASE_USER} --password=${DATABASE_PASSWORD} --port 3306 --host ${DATABASE_HOST} cat | grep -v Wildcard | grep -o dailygraph`
if [ "$RESULT" != "dailygraph" ]; then
    mysql -u ${DATABASE_USER} --password=${DATABASE_PASSWORD} --port 3306 --host ${DATABASE_HOST} cat < /app/Cat.sql
    echo 'Init database from Cat.sql'
fi

sed -i "s/jdbcHost/$DATABASE_HOST/g" /data/appdatas/cat/datasources.xml
sed -i "s/jdbcUser/$DATABASE_USER/g" /data/appdatas/cat/datasources.xml
sed -i "s/jdbcPassword/$DATABASE_PASSWORD/g" /data/appdatas/cat/datasources.xml

catalina.sh run