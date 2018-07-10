#!/usr/bin/env bash

echo "Enter PID of process to attach"

if ps -p $1 > /dev/null
then
	echo "$1" | ~/bin/pg_debug
	killall rofi
fi
