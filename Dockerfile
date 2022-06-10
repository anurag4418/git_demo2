FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
zip \
unzip
ADD https://https://www.free-css.com/assets/files/free-css-templates/download/page279/icream.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip icream.zip
RUN cp -rvf ice-cream-shop-website-template/* .
RUN rm -rf ice-cream-shop-website-template icream.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
