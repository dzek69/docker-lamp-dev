FROM ubuntu:18.04

COPY install-scripts install-scripts
RUN chmod +x -R install-scripts

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN ./install-scripts/basic.sh
RUN ./install-scripts/node.sh
RUN ./install-scripts/php.sh
RUN ./install-scripts/http.sh
RUN ./install-scripts/db.sh
RUN ./install-scripts/utils.sh

RUN rm -r install-scripts

COPY copy/ /
RUN chmod +x /usr/sbin/start.sh

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /var/lib/mysql
VOLUME /var/log/mysql

EXPOSE 80

CMD ["/usr/sbin/start.sh"]
