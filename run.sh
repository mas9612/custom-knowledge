#!/bin/sh

if [ -n "$DB_URL" ]; then
    POSTGRES_URL="jdbc:${DB_URL}"
else
    POSTGRES_URL="jdbc:postgresql://postgres:5432/knowledge"
fi

if [ -n "$DB_USER" ]; then
    POSTGRES_USER=$DB_USER
else
    POSTGRES_USER="postgres"
fi

if [ -n "$DB_PASSWORD" ]; then
    POSTGRES_PASSWORD=$DB_PASSWORD
else
    POSTGRES_PASSWORD="dummy"
fi

if [ -n "$DB_SCHEMA" ]; then
    POSTGRES_SCHEMA=$DB_SCHEMA
else
    POSTGRES_SCHEMA="public"
fi

sed -i -e "5s|><|>${POSTGRES_URL}<|" /root/.knowledge/custom_connection.xml
sed -i -e "6s/></>${POSTGRES_USER}</" /root/.knowledge/custom_connection.xml
sed -i -e "7s/></>${POSTGRES_PASSWORD}</" /root/.knowledge/custom_connection.xml
sed -i -e "8s/></>${POSTGRES_SCHEMA}</" /root/.knowledge/custom_connection.xml

# run knowledge
/usr/local/bin/dumb-init /usr/local/tomcat/bin/catalina.sh run
