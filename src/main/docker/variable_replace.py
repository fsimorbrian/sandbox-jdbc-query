import os

#
# Replace backend context vars
#
f = open('/opt/webserver/conf/Catalina/localhost/ROOT.xml', 'r')
content = f.read()
f.close()

#content = content.replace(r"${DOC_DB_SERVICE_NAME}", os.environ['DB_SERVICE_NAME'])
content = content.replace(r"${DOC_DB_SERVICE_NAME}", "TESTING123")
content = content.replace(r"${DOC_POSTGRESQL_USER}", os.environ['POSTGRESQL_USER'])
content = content.replace(r"${DOC_POSTGRESQL_PASSWORD}", os.environ['POSTGRESQL_PASSWORD'])
content = content.replace(r"${DOC_POSTGRESQL_APPLICATION_ADMIN_USER}", os.environ['POSTGRESQL_APPLICATION_ADMIN_USER'])
content = content.replace(r"${DOC_POSTGRESQL_APPLICATION_ADMIN_PASSWORD}", os.environ['POSTGRESQL_APPLICATION_ADMIN_PASSWORD'])
content = content.replace(r"${DOC_POSTGRESQL_DATABASE}", os.environ['POSTGRESQL_DATABASE'])
content = content.replace(r"${DOC_POSTGRESQL_STORAGE_DATABASE}", os.environ['POSTGRESQL_STORAGE_DATABASE'])

f = open('/opt/webserver/conf/Catalina/localhost/ROOT.xml', 'w+')
f.write(content)
f.close()
