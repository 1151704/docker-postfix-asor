#!/bin/bash
echo "Starting my mailserver..."

debconf-set-selections <<< "postfix postfix/mailname string postfixasor.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

apt-get install --assume-yes postfix
useradd -m -G mail -p pass1 user1 && touch /var/mail/user1 && chown user1:mail /var/mail/user1
useradd -m -G mail -p pass2 user2 && touch /var/mail/user2 && chown user2:mail /var/mail/user2

apt-get install rsyslog -y

tail -f /var/log/mail.log