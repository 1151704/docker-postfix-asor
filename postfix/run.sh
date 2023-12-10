#!/bin/bash
cp /main.cf /etc/postfix/main.cf
echo "disable_plaintext_auth = no" >> /etc/dovecot/conf.d/10-auth.conf
echo "mail_location = maildir:~/Maildir" >> /etc/dovecot/conf.d/10-mail.conf

service rsyslog restart;
service postfix restart;
service dovecot restart;
/bin/echo "FINALIZÓ TODO.";
sleep 20;
tail -f /var/log/mail.log