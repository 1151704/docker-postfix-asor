#!/bin/bash
service rsyslog restart;
service postfix restart;
service dovecot restart;
/bin/echo "FINALIZÓ TODO.";
sleep 20;
tail -f /var/log/mail.log