# Docker Base Tools

Containers with base tools.

## Freeswitch

Mount configuration as `/etc/freeswitch` directory. If you want to persist logs, mount `/var/log/freeswitch/` to a volume.

## Postfix

Just use the `/etc/postfix` directory as a volume.

## MailSystem

This is a full-fledged mail system with postfix, opendkim and dovecot. There are several directories you can mount:

- `/etc/postfix`: Postfix configuration
- `/etc/opendkim`: Opendkim configuration
- `/etc/dovecot`: Dovecot configuration
- `/var/email`: Mailboxes
- `/var/log/mail.log`: All logs

If you want to persist logs, mount `/var/log/` to a volume.