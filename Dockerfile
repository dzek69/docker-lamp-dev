FROM ubuntu:16.04

COPY install-scripts install-scripts
RUN chmod +x -R install-scripts

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
