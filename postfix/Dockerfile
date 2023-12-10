FROM ubuntu:20.04

RUN apt-get update

#RUN debconf-set-selections <<< "postfix postfix/mailname string postfixasor.com"
#RUN debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

RUN { \
        echo postfix postfix/mailname string 'postfixasor.com'; \
        echo postfix postfix/main_mailer_type string 'Internet Site'; \
    } | debconf-set-selections
RUN apt-get install --assume-yes postfix
RUN apt-get install net-tools nano bsd-mailx dovecot-pop3d rsyslog -y
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf 

RUN useradd -m -G mail -p pass1 user1 && touch /var/mail/user1 && chown user1:mail /var/mail/user1
RUN useradd -m -G mail -p pass2 user2 && touch /var/mail/user2 && chown user2:mail /var/mail/user2

COPY main.cf /etc/postfix/main.cf
#RUN echo "disable_plaintext_auth = no" >> /etc/dovecot/conf.d/10-auth.conf
#RUN echo "mail_location = maildir:~/Maildir" >> /etc/dovecot/conf.d/10-mail.conf

RUN sed -i 's/^#disable_plaintext_auth = yes/disable_plaintext_auth = no/' /etc/dovecot/conf.d/10-auth.conf
RUN sed -i 's/^# *mail_location = maildir:~\/Maildir/mail_location = maildir:~\/Maildir/' /etc/dovecot/conf.d/10-mail.conf


ADD run.sh /
RUN chmod +x run.sh
ENTRYPOINT ["/run.sh"]

# docker image
# docker build -t test-postfix .

# docker container
# docker run -d -p 25:25 -p 110:110 -p 995:995 --name test-postfix --hostname postfixasor.com test-postfix

# access to container
# docker exec -it test-postfix /bin/bash

# romove container
# docker stop test-postfix && docker rm test-postfix
