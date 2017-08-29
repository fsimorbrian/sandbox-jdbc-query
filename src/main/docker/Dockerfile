#available outside openshift, on open internet
#FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift
FROM registry.access.redhat.com/jboss-webserver-3/webserver30-tomcat8-openshift

#available in openshift pipeline, above FROM is replaced when using dockerStrategy in BuildConfig
#FROM webserver31-tomcat8

# must use root because we are changing permissions and installing files
USER root

# update to oracle java
WORKDIR /tmp
RUN curl -LO http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -H --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"; \
    rpm --quiet -U jdk-8u131-linux-x64.rpm; \
    rm -f jdk-8u131-linux-x64.rpm;

# configure tomcat
WORKDIR /opt/webserver
RUN rm -Rf webapps/*
RUN echo 'export JAVA_HOME=/usr/java/latest' >> bin/setenv.sh; \
    chmod 755 bin/setenv.sh; \
    mkdir -p conf/Catalina/localhost; \
    chmod 775 conf/Catalina/localhost; \
    touch conf/Catalina/localhost/ROOT.xml; \
    chmod 775 conf/Catalina/localhost/ROOT.xml; \
    chmod -R 755 conf;

WORKDIR /usr/local/src
COPY ROOT.xml ROOT.xml
COPY launch_wrapper.sh launch_wrapper.sh
RUN chmod 755 launch_wrapper.sh; chmod 644 ROOT.xml; chmod 775 .


# above provides the configured platform
# the war is copied later -- TBD
# COPY jdbc-query.war /opt/webserver/webapps/ROOT.war

CMD /usr/local/src/launch_wrapper.sh
