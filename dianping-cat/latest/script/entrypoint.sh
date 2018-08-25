#!/usr/bin/env bash

RESULT=`mysqlshow -u ${DATABASE_USER} --password=${DATABASE_PASSWORD} --port 3306 --host ${DATABASE_HOST} cat | grep -v Wildcard | grep -o dailygraph`
if [ "$RESULT" != "dailygraph" ]; then
    mysql -u ${DATABASE_USER} --password=${DATABASE_PASSWORD} --port 3306 --host ${DATABASE_HOST} cat < /app/Cat.sql
    echo 'Init database from Cat.sql'
fi

catalina.sh run