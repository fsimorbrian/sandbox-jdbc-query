#!/bin/bash

sed 's/\${DOC_DB_SERVICE_NAME}/AAABBBCCC/' /usr/local/src/ROOT.xml > /opt/webserver/conf/Catalina/localhost/ROOT.xml

echo "Test in usr/local/src" > /usr/local/src/test1.txt

echo "Test in /opt/webserver/conf/Catalina/localhost" > /opt/webserver/conf/Catalina/localhost/test2.txt

/opt/webserver/bin/launch.sh
