#!/bin/sh

set -eu

install -d -o postfix -g postfix /var/lib/postfix
install -d -m 0755 /var/spool/postfix /var/spool/postfix/etc /var/spool/postfix/pid
for queue in active bounce corrupt defer deferred flush hold incoming saved trace; do
  install -d -m 0700 -o postfix -g postfix "/var/spool/postfix/$queue"
done
install -d -m 0700 -o postfix -g postfix /var/spool/postfix/private
install -d -m 0730 -o postfix -g postdrop /var/spool/postfix/maildrop
install -d -m 0710 -o postfix -g postdrop /var/spool/postfix/public
install -d -o dovecot -g dovecot /run/dovecot
install -d -o opendkim -g opendkim /run/opendkim
install -d -m 0755 /etc/postfix/dynamicmaps.cf.d /etc/postfix/postfix-files.d
cp /usr/share/postfix/container/postfix-files /etc/postfix/postfix-files
cp /usr/share/postfix/container/dynamicmaps.cf /etc/postfix/dynamicmaps.cf
cp /usr/share/postfix/container/dynamicmaps.cf.d/lmdb /etc/postfix/dynamicmaps.cf.d/lmdb
cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf

# Validate all externally mounted configuration before starting any daemon.
postfix -c /etc/postfix check
doveconf -c /etc/dovecot/dovecot.conf -n >/dev/null
opendkim -x /etc/opendkim/opendkim.conf -n

exec /usr/bin/supervisord -c /etc/supervisord.conf
