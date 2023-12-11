#!/bin/bash
service rsyslog restart;
service postfix restart;
service dovecot restart;
sleep 20;
tail -f /var/log/mail.log