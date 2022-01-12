FROM tomcat:latest

LABEL maintainer="VKR"

ADD ./target/spring-boot-actuator-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
