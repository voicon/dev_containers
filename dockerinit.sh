#!/bin/bash

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANGUAGE=en_us.UTF-8

# Change the UID based on volume, since we can't assume UID 1000 will match
# everyone's situation. This is especially not true for enterprise logins.
USER_ID=$(stat -c '%u' /data)
if [ "$USER_ID" -gt "0" ] && [ "$USER_ID" != "1000" ] ; then
	usermod -u $USER_ID developer
fi

# Automatically enter the mounted application root
cd /data

# Change to developer, spawn the command given
/usr/bin/su developer -c "$@"
