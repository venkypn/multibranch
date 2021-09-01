FROM tomcat:9
MAINTAINER venkatesh.venkyrokzs@gmail.com
COPY target/*.war /usr/local/tomcat/webapps/multibranch.war
