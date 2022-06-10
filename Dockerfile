FROM alpine:3.14
RUN sudo yum -y install httpd \
zip \
unzip
ADD https://www.free-css.com/asstes/files/free-css-templates/download/page247/kindle.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip kindle.zip
RUN cp -rvf markups-kindle/* .
RUN rm -rf _MACOSX markups-kindle kindle.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
