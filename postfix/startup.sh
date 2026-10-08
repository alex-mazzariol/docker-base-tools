#!/bin/sh

set -eu

# Explicit commands (notably the network-isolated Ansible postmap job) use the
# image's native package configuration and do not need a mail queue.
if [ "$#" -gt 0 ]; then
  exec "$@"
fi

install -d -o postfix -g postfix /var/lib/postfix
install -d -m 0755 -o root -g root /var/spool/postfix /var/spool/postfix/etc
install -d -m 0755 -o root -g postfix /var/spool/postfix/pid
for queue in active bounce corrupt defer deferred flush hold incoming saved trace; do
  install -d -m 0700 -o postfix -g postfix "/var/spool/postfix/$queue"
done
install -d -m 0700 -o postfix -g postfix /var/spool/postfix/private
install -d -m 0730 -o postfix -g postdrop /var/spool/postfix/maildrop
install -d -m 0710 -o postfix -g postdrop /var/spool/postfix/public
cp /etc/resolv.conf /var/spool/postfix/etc/resolv.conf

postfix -c /etc/postfix check
exec postfix -c /etc/postfix start-fg
