# Docker Base Tools

Containers with base tools.

## Freeswitch

Mount configuration as `/etc/freeswitch` directory. If you want to persist logs, mount `/var/log/freeswitch/` to a volume.

## Postfix

Just use the `/etc/postfix` directory as a volume.

## MailSystem

This is a full-fledged mail system with Postfix, OpenDKIM and Dovecot. It is
built on a pinned Alpine stable release and uses a fixed `mailstore` UID/GID of
`1001:1001`. There are several directories you can mount:

- `/etc/postfix`: Postfix configuration
- `/etc/opendkim`: Opendkim configuration
- `/etc/dovecot`: Dovecot configuration
- `/var/email`: Mailboxes
- `/var/lib/postfix`: Postfix state
- `/var/spool/postfix`: Postfix queue and private Dovecot sockets

Mail-facility logs are written to the container log. The image exposes SMTP,
submission, IMAP and IMAPS; POP3 and ManageSieve are intentionally not included.
