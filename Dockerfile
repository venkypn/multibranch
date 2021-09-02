FROM centos:latest
MAINTAINER venkatesh.venkyrokzs@gmail.com
RUN yum install -y httpd \
zip \
unzip \
curl
WORKDIR /var/www/html/
RUN curl https://www.free-css.com/assets/files/free-css-templates/download/page270/helpz.zip -o helpz.zip
RUN unzip helpz.zip
RUN cp -rvf free-charity-website-template/* .
RUN rm -rf helpz.zip free-charity-website-template
CMD ["/var/lib/httpd", "-D", "FOREGROUND"]
EXPOSE 80
