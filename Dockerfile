From tomcat:9
ADD DevOpsClassCodes/target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
