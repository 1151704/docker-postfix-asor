FROM ubuntu:20.04

RUN apt-get update

RUN { \
        echo postfix postfix/mailname string 'postfixasor.com'; \
        echo postfix postfix/main_mailer_type string 'Internet Site'; \
    } | debconf-set-selections
RUN apt-get install --assume-yes postfix
RUN apt-get install net-tools nano apache2 bsd-mailx dovecot-pop3d dovecot-imapd -y

RUN { \
        echo mysql-server mysql-server/root_password password 'root'; \
        echo mysql-server mysql-server/root_password password 'root'; \
    } | debconf-set-selections
RUN apt-get install -y mysql-server
RUN service mysql start

RUN { \
        echo roundcube-core roundcube/dbconfig-install select 'ignore'; \
    } | debconf-set-selections
RUN apt-get install --assume-yes roundcube

ADD create-user.sh /
RUN chmod +x create-user.sh

RUN ./create-user.sh omar ufps2023
RUN ./create-user.sh edinson ufps2023
RUN ./create-user.sh inge ufps2023

COPY main.cf /etc/postfix/main.cf

RUN sed -i 's/^#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-auth.conf
RUN sed -i 's/^mail_location = */#miail_location = /' /etc/dovecot/conf.d/10-mail.conf
RUN sed -i 's/^# *mail_location = maildir:~\/Maildir/mail_location = maildir:~\/Maildir/' /etc/dovecot/conf.d/10-mail.conf

ADD roundcube.conf /etc/apache2/sites-available/
RUN cd /etc/apache2/sites-enabled/ && a2ensite roundcube.conf

COPY config.inc.php /etc/roundcube/config.inc.php

EXPOSE 25 80 110 143 995

RUN service postfix restart
RUN service dovecot restart
RUN service apache2 restart

CMD ["apache2ctl", "-D", "FOREGROUND"]