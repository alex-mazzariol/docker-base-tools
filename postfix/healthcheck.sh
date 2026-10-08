#!/bin/sh

set -eu

pid_file=/var/spool/postfix/pid/master.pid
test -s "$pid_file"
master_pid="$(tr -d '[:space:]' < "$pid_file")"
test -n "$master_pid"
kill -0 "$master_pid"
