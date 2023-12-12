FROM ubuntu:20.04

RUN apt-get update

RUN { \
        echo postfix postfix/mailname string 'postfixasor.com'; \
        echo postfix postfix/main_mailer_type string 'Internet Site'; \
    } | debconf-set-selections
RUN apt-get install --assume-yes postfix
RUN apt-get install net-tools nano bsd-mailx dovecot-pop3d dovecot-imapd rsyslog -y
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf 

ADD create-user.sh /
RUN chmod +x create-user.sh

RUN ./create-user.sh omar ufps2023
RUN ./create-user.sh edinson ufps2023
RUN ./create-user.sh inge ufps2023

COPY main.cf /etc/postfix/main.cf

RUN sed -i 's/^#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-auth.conf
RUN sed -i 's/^mail_location = */#miail_location = /' /etc/dovecot/conf.d/10-mail.conf
RUN sed -i 's/^# *mail_location = maildir:~\/Maildir/mail_location = maildir:~\/Maildir/' /etc/dovecot/conf.d/10-mail.conf

ADD run.sh /
RUN chmod +x run.sh
ENTRYPOINT ["/run.sh"]
