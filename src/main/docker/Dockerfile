#available outside openshift, on open internet
FROM registry.access.redhat.com/jboss-webserver-3/webserver31-tomcat8-openshift

#available in openshift pipeline, above FROM is replaced when using dockerStrategy in BuildConfig
#FROM webserver31-tomcat8

# must use root because we are changing permissions and installing files
USER root
#RUN rm -Rf /opt/webserver/webapps/*
#ADD ROOT.xml /opt/webserver/conf/Catalina/localhost/
#ADD startup.sh /usr/local/src/
#ADD variable_replace.py /usr/local/src/
#RUN chmod 755 /usr/local/src/variable_replace.py; \
#	chmod 755 /usr/local/src/startup.sh; \
#	chmod 777 /opt/webserver/conf/Catalina/localhost/ROOT.xml; \
#	chmod 777 /opt/webserver/conf/Catalina/localhost/backend.xml; \
#	chmod 777 /var/jboss/vram-ufs-application.properties




# update to oracle java
WORKDIR /tmp
RUN curl -LO http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm -H --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"; \
    rpm --quiet -U jdk-8u131-linux-x64.rpm; \
    rm -f jdk-8u131-linux-x64.rpm;

# configure tomcat
WORKDIR /opt/webserver
ADD ROOT.xml /opt/webserver/conf/Catalina/localhost/
RUN rm -Rf webapps/*
RUN echo 'export JAVA_HOME=/usr/java/latest' >> bin/setenv.sh; \
    chmod 755 bin/setenv.sh; \
    mkdir -p conf/Catalina/localhost; \
    chmod 775 conf/Catalina/localhost; \
    chmod 777 conf/Catalina/localhost/ROOT.xml; \
    chmod -R 755 conf;

WORKDIR /usr/local/src
ADD variable_replace.py variable_replace.py
#COPY ROOT.xml ROOT.xml
ADD launch_wrapper.sh launch_wrapper.sh
RUN chmod 755 launch_wrapper.sh; chmod 775 .


# above provides the configured platform
# the war is copied later -- TBD
# COPY jdbc-query.war /opt/webserver/webapps/ROOT.war

USER jboss
CMD /usr/local/src/launch_wrapper.sh
