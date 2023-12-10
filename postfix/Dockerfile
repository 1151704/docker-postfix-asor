FROM ubuntu:20.04

RUN apt-get install -y postfix
RUN apt-get install -y rsyslog

RUN useradd -m -G mail -p pass1 user1 && touch /var/mail/user1 && chown user1:mail /var/mail/user1
RUN useradd -m -G mail -p pass2 user2 && touch /var/mail/user2 && chown user2:mail /var/mail/user2

ADD run.sh /
RUN chmod +x run.sh
ENTRYPOINT ["/run.sh"]