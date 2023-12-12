#!/bin/bash
service rsyslog restart;
service postfix restart;
service dovecot restart;
tail -f /var/log/mail.log