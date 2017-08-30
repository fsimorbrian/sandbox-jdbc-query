#!/bin/bash

export JAVA_HOME=/usr/java/latest

sed "s/\${DOC_DB_SERVICE_NAME}/${DOC_DB_SERVICE_NAME}/" /usr/local/src/ROOT.xml \
| sed "s/\${DOC_POSTGRESQL_DATABASE}/${DOC_POSTGRESQL_DATABASE}/" \
| sed "s/\${DOC_POSTGRESQL_USER}/${DOC_POSTGRESQL_USER}/" \
| sed "s/\${DOC_POSTGRESQL_PASSWORD}/${DOC_POSTGRESQL_PASSWORD}/" \
| sed "s/\${OBJ_DB_SERVICE_NAME}/${OBJ_DB_SERVICE_NAME}/" /usr/local/src/ROOT.xml \
| sed "s/\${OBJ_POSTGRESQL_DATABASE}/${OBJ_POSTGRESQL_DATABASE}/" \
| sed "s/\${OBJ_POSTGRESQL_USER}/${OBJ_POSTGRESQL_USER}/" \
| sed "s/\${OBJ_POSTGRESQL_PASSWORD}/${OBJ_POSTGRESQL_PASSWORD}/" \
> /opt/webserver/conf/Catalina/localhost/ROOT.xml
