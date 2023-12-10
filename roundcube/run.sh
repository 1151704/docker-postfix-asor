#!/bin/bash
service rsyslog restart;
service mysql restart;
/bin/echo "FINALIZÓ TODO.";
sleep 20;
tail -f /var/log/mysql/error.log