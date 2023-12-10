#!/bin/bash
service rsyslog start;
service postfix start;
/bin/echo "FINALIZÓ TODO.";
sleep 20;
tail -f /var/log/mail.log