#!/bin/sh

set -eu

status="$(supervisorctl -c /etc/supervisord.conf status)"
printf '%s\n' "$status" | grep -q '^rsyslog[[:space:]].*RUNNING'
printf '%s\n' "$status" | grep -q '^opendkim[[:space:]].*RUNNING'
printf '%s\n' "$status" | grep -q '^dovecot[[:space:]].*RUNNING'
printf '%s\n' "$status" | grep -q '^postfix[[:space:]].*RUNNING'
printf '%s\n' "$status" | grep -q '^crond[[:space:]].*RUNNING'

doveadm service status >/dev/null
