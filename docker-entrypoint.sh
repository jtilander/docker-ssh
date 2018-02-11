#!/bin/sh
set -e

if [ "$1" = "ssh" ]; then
	shift

	# Get the keys from URL
	mkdir -p /root/.ssh
	curl -SsL -o /root/.ssh/authorized_keys "${KEYS_URL}"
	chmod 0744 /root/.ssh/authorized_keys

	# Generate host keys (unfortunatly they will change)
	ssh-keygen -A

	# Start in foreground and send messages to stderr
	exec /usr/sbin/sshd -D -e "$@"
fi

exec "$@"
