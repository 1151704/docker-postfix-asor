FROM ubuntu:20.04

RUN apt-get update

RUN debconf-set-selections <<< "postfix postfix/mailname string postfixasor.com"
RUN debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
RUN apt-get install --assume-yes postfix
RUN apt-get install rsyslog -y
RUN sed -i '/imklog/s/^/#/' /etc/rsyslog.conf 

RUN useradd -m -G mail -p pass1 user1 && touch /var/mail/user1 && chown user1:mail /var/mail/user1
RUN useradd -m -G mail -p pass2 user2 && touch /var/mail/user2 && chown user2:mail /var/mail/user2

ADD run.sh /
RUN chmod +x run.sh
ENTRYPOINT ["/run.sh"]