FROM ubuntu:20.04

RUN apt-get update
RUN { \
        echo mysql-server mysql-server/root_password password pass1; \
        echo mysql-server mysql-server/root_password_again password pass1; \
    } | debconf-set-selections
# RUN echo "mysql-server mysql-server/root_password password pass1" | debconf-set-selections && \
#     echo "mysql-server mysql-server/root_password_again password pass1" | debconf-set-selections

RUN apt-get install --assume-yes mysql-server
RUN apt-get install dovecot-imapd roundcube rsyslog net-tools nano -y
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf 

#COPY main.cf /etc/postfix/main.cf


RUN sed -i "s/\$config\['default_host'\] = '';/\$config\['default_host'\] = 'postfixasor.com';/" /etc/roundcube/config.inc.php
RUN sed -i "s/\$config\['smtp_server'\] = 'localhost';/\$config\['smtp_server'\] = 'postfixasor.com';/" /etc/roundcube/config.inc.php
RUN sed -i "s/\$config\['smtp_port'\] = 587;/\$config\['smtp_port'\] = 25;/" /etc/roundcube/config.inc.php
RUN sed -i "s/\$config\['smtp_user'\] = '%u';/\$config\['smtp_user'\] = '';/" /etc/roundcube/config.inc.php

EXPOSE 3306

ADD run.sh /
RUN chmod +x run.sh
ENTRYPOINT ["/run.sh"]

