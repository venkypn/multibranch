FROM centos:latest
MAINTAINER venkatesh.venkyrokzs@gmail.com
ADD https://www.free-css.com/assets/files/free-css-templates/download/page270/helpz.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip helpz.zip
RUN cp -r helpz/* .
RUN rm -rf helpz helpz.zip
CMD ["/usr/bin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
