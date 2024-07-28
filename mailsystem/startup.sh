#!/bin/bash

set -e

mkdir -p /var/spool/postfix/etc
cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf

chown -R opendkim:opendkim /etc/opendkim
chown -R root:root /etc/postfix
touch /var/lib/postfix/smtp_scache /var/lib/postfix/smtpd_scache
chown -R postfix:postfix /var/lib/postfix/smtp*